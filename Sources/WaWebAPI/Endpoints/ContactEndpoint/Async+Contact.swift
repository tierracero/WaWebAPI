import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension ContactEndpoint {

  public func acceptInvite(
    contactId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("block"),
      payload: BlockRequest(
        contactId: contactId
      ))
  }

  public func getAbout(
    contactId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("getAbout"),
      payload: GetAboutRequest(
        contactId: contactId
      ))
  }

  public func getChat(
    contactId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("getChat"),
      payload: GetChatRequest(
        contactId: contactId
      ))
  }

  public func getCommonGroups(
    contactId: String
  ) async throws -> WAResponsePayload<[String]> {
    return try await api.post(
      WAResponsePayload<[String]>.self, endpoint: .client("getCommonGroups"),
      payload: GetCommonGroopsRequest(
        contactId: contactId
      ))
  }

  public func getProfilePicUrl(
    contactId: String
  ) async throws -> WAResponsePayload<String> {
    return try await api.post(
      WAResponsePayload<String>.self, endpoint: .client("getProfilePicUrl"),
      payload: GetProfilePicUrlRequest(
        contactId: contactId
      ))
  }

  public func unblock(
    contactId: String
  ) async throws -> WAResponsePayload<UnblockResponse> {
    return try await api.post(
      WAResponsePayload<UnblockResponse>.self, endpoint: .client("unblock"),
      payload: UnblockRequest(
        contactId: contactId
      ))
  }

}
