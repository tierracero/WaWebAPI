import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension ChatEndpoint {

  public func archive(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("archive"),
      payload: ArchiveRequest(
        chatId: chatId
      ))
  }

  public func changeLabels(
    chatId: WhatsAppChatId,
    labelIds: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("changeLabels"),
      payload: ChangeLabelsRequest(
        chatId: chatId,
        labelIds: labelIds
      ))
  }

  public func clearMessages(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("clearMessages"),
      payload: ClearMessagesRequest(
        chatId: chatId
      ))
  }

  public func clearState(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("clearState"),
      payload: ClearStateRequest(
        chatId: chatId
      ))
  }

  public func delete(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("delete"),
      payload: DeleteRequest(
        chatId: chatId
      ))
  }

  public func fetchMessages(
    chatId: WhatsAppChatId,
    searchOptions: SearchOptions
  ) async throws -> WAResponsePayload<[Message]> {
    return try await api.post(
      WAResponsePayload<[Message]>.self, endpoint: .chat("fetchMessages"),
      payload: FetchMessagesRequst(
        chatId: chatId,
        searchOptions: searchOptions
      ))
  }

  public func getContact(
    chatId: WhatsAppChatId
  ) async throws -> WAResponsePayload<[Contact]> {
    return try await api.post(
      WAResponsePayload<[Contact]>.self, endpoint: .chat("getContact"),
      payload: GetContactRequst(
        chatId: chatId
      ))
  }

  public func getLabels(
    chatId: WhatsAppChatId
  ) async throws -> WAResponsePayload<[Label]> {
    return try await api.post(
      WAResponsePayload<[Label]>.self, endpoint: .chat("getLabels"),
      payload: GetLabelsRequst(
        chatId: chatId
      ))
  }

  public func markUnread(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("markUnread"),
      payload: MarkUnreadRequst(
        chatId: chatId
      ))
  }

  public func mute(
    chatId: WhatsAppChatId,
    unmuteDate: Int64?
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("mute"),
      payload: MuteRequst(
        chatId: chatId,
        unmuteDate: unmuteDate
      ))
  }

  public func pin(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("pin"),
      payload: PinRequst(
        chatId: chatId
      ))
  }

  public func sendSeen(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("sendSeen"),
      payload: SendSeenRequst(
        chatId: chatId
      ))
  }

  public func sendStateRecording(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("sendStateRecording"),
      payload: SendStateRecordingRequst(
        chatId: chatId
      ))
  }

  public func sendStateTyping(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("sendStateTyping"),
      payload: SendStateTypingRequst(
        chatId: chatId
      ))
  }

  public func unarchive(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("unarchive"),
      payload: UnarchiveRequst(
        chatId: chatId
      ))
  }

  public func unmute(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("unmute"),
      payload: UnmuteRequst(
        chatId: chatId
      ))
  }

  public func unpin(
    chatId: WhatsAppChatId
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("unpin"),
      payload: UnpinRequst(
        chatId: chatId
      ))
  }

}
