import Foundation
import PostgresBridge
import SQL
import TCFoundation
import TCFundamentals
import Vapor
import VaporBridges
import WaWebAPICore

/// Actor-isolated cache for account snapshots used by this package.
private actor WaWebAccountsCache {
  static let shared = WaWebAccountsCache()

  private var accounts: [UUID: WaWebAccountsItem] = [:]

  func get(_ id: UUID) -> WaWebAccountsItem? {
    accounts[id]
  }

  func set(_ account: WaWebAccountsItem, for id: UUID) {
    accounts[id] = account
  }
}

func getWaWebAccounts(app: Application, id: UUID) async throws -> WaWebAccountsItem? {
  if let cachedAccount = await WaWebAccountsCache.shared.get(id) {
    return cachedAccount
  }

  let account = try await app.postgres.transaction(to: .psqlEnvironment) { conn in
    SQL.select(WaWebAccounts.table.*).from(WaWebAccounts.table).where(
      \WaWebAccounts.$id == id
    ).execute(on: conn).first(decoding: WaWebAccountsItem.self)
  }.get()

  guard let account else {
    return nil
  }

  await WaWebAccountsCache.shared.set(account, for: id)
  return account
}
