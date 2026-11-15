import Crypto
import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension API {

  private func requestPath(for endpoint: EndpointControler) -> String {
    var path = endpoint.path

    switch endpoint {
    case .call(let value),
      .chat(let value),
      .client(let value),
      .contact(let value),
      .groop(let value),
      .instance(let value),
      .label(let value),
      .message(let value),
      .poll(let value),
      .privateChat(let value),
      .reaction(let value):
      if !value.isEmpty {
        path += "/\(value)"
      }
    }

    return path
  }

  private func makeHeaders(
    token: WaWebTokensItem,
    payloadData: Data?
  ) -> HTTPHeaders {
    var headers = HTTPHeaders([
      ("Accept", "application/json"),
      ("token", token.token),
      ("instanceid", profile.instanceId),
    ])

    if let secret = token.secret,
      let payloadData,
      let secretData = secret.data(using: .utf8)
    {
      let key = SymmetricKey(data: secretData)
      let authenticationCode = HMAC<SHA256>.authenticationCode(
        for: payloadData,
        using: key
      )
      headers.add(name: "x-wawebapi-hmac", value: authenticationCode.hex)
    }

    return headers
  }

  private func requestContext(
    endpoint: EndpointControler,
    payloadData: Data?
  ) async throws -> (headers: HTTPHeaders, url: URI) {
    guard
      let token = try await getWaWebTokens(
        app: application,
        waWebAccount: profile.waWebAccount,
        instanceId: profile.instanceId
      )
    else {
      throw TCErrors.generalError(error: "Failed to locate token")
    }

    let headers = makeHeaders(token: token, payloadData: payloadData)
    let url = URI(
      scheme: "https",
      host: "waweb.tierracero.co",
      path: "api/v1/\(requestPath(for: endpoint))"
    )

    return (headers, url)
  }

  private func send<Payload: Content & Sendable>(
    endpoint: EndpointControler,
    payload: Payload
  ) async throws -> ClientResponse {
    let payloadData = try JSONEncoder().encode(payload)
    let context = try await requestContext(endpoint: endpoint, payloadData: payloadData)

    do {
      return try await application.client.post(context.url, headers: context.headers) { request in
        try request.content.encode(payload)
      }.get()
    } catch {
      throw TCErrors.generalError(error: "Request failed for \(context.url.path)")
    }
  }

  private func send(endpoint: EndpointControler) async throws -> ClientResponse {
    let context = try await requestContext(endpoint: endpoint, payloadData: nil)

    do {
      return try await application.client.post(context.url, headers: context.headers).get()
    } catch {
      throw TCErrors.generalError(error: "Request failed for \(context.url.path)")
    }
  }

  private func decode<T: Codable>(
    _ type: T.Type,
    from response: ClientResponse,
    endpoint: EndpointControler
  ) throws -> T {
    do {
      return try response.content.decode(T.self, using: JSONDecoder())
    } catch {
      throw TCErrors.generalError(
        error: "Unable to decode response for \(requestPath(for: endpoint))"
      )
    }
  }

  func post<T: Codable & Sendable, Payload: Content & Sendable>(
    _ type: T.Type,
    endpoint: EndpointControler,
    payload: Payload
  ) async throws -> T {
    let response = try await send(endpoint: endpoint, payload: payload)
    return try decode(T.self, from: response, endpoint: endpoint)
  }

  func post<T: Codable & Sendable>(
    _ type: T.Type,
    endpoint: EndpointControler
  ) async throws -> T {
    let response = try await send(endpoint: endpoint, payload: nil)
    return try decode(T.self, from: response, endpoint: endpoint)
  }

  func post(endpoint: EndpointControler) async throws -> WAResponse {
    let response = try await send(endpoint: endpoint, payload: nil)
    return try decode(WAResponse.self, from: response, endpoint: endpoint)
  }
}
