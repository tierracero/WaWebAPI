import Bridges
import Foundation
import PostgresBridge
import SQL
import Vapor
import VaporBridges
import WaWebAPICore

/// [ WaWebTokens.token : WaWebTokens ]
private actor TokenControler {

  static let shared = TokenControler()

  private var waWaWebTokens: [String: WaWebTokensItem] = [:]

  func get(instanceId: String) -> WaWebTokensItem? {
    waWaWebTokens[instanceId]
  }

  func set(instanceId: String, token: WaWebTokensItem) {
    waWaWebTokens[instanceId] = token
  }

  func get(tokenId: String) -> WaWebTokensItem? {
    waWaWebTokens[tokenId]
  }

  func set(tokenId: String, token: WaWebTokensItem) {
    waWaWebTokens[tokenId] = token
  }
}

func getWaWebTokens(
  app: Application,
  waWebAccount: UUID,
  instanceId: String
) async throws -> WaWebTokensItem? {
  if let token = await TokenControler.shared.get(instanceId: instanceId) {
    return token
  }

  let token = try await app.postgres.transaction(to: .psqlEnvironment) { conn in
    let query = SQL.select(WaWebTokens.table.*).from(WaWebTokens.table).where(
      \WaWebTokens.$waWebAccount == waWebAccount
        && \WaWebTokens.$instanceId ||> PgArray([instanceId]) => .textArray
    )

    return query.execute(on: conn).first(decoding: WaWebTokensItem.self)
  }.get()

  guard let token else {
    return nil
  }

  await TokenControler.shared.set(instanceId: instanceId, token: token)
  return token
}

/// token can be api or auth token
func getWaWebTokens(
  app: Application,
  token tokenId: String,
  instanceId: String?
) async throws -> WaWebTokensItem? {
  if let token = await TokenControler.shared.get(tokenId: tokenId) {
    if let instanceId, let tokens = token.instanceId, !tokens.contains(instanceId) {
      return nil
    }
    return token
  }

  var query = SQL.select(WaWebTokens.table.*).from(WaWebTokens.table).where(
    \WaWebTokens.$token == tokenId
  )

  if let instanceId {
    query = query.and(
      |(\WaWebTokens.$instanceId == nil
        || \WaWebTokens.$instanceId ||> PgArray([instanceId]) => .textArray)|
    )
  }

  let token = try await app.postgres.transaction(to: .psqlEnvironment) { conn in
    query.execute(on: conn).first(decoding: WaWebTokensItem.self)
  }.get()

  guard let token else {
    return nil
  }

  await TokenControler.shared.set(tokenId: tokenId, token: token)
  return token
}
