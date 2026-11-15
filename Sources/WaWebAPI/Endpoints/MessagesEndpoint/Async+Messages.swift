import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension MessageEndpoint {

  public func delete(
    messageId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("delete"),
      payload: DeleteRequest(
        messageId: messageId
      ))
  }

  public func downloadMedia(
    messageId: String
  ) async throws -> WAResponsePayload<MessageMedia> {
    return try await api.post(
      WAResponsePayload<MessageMedia>.self, endpoint: .chat("downloadMedia"),
      payload: DownloadMediaRequest(
        messageId: messageId
      ))
  }

  public func edit(
    messageId: String
  ) async throws -> WAResponsePayload<MessageItem> {
    return try await api.post(
      WAResponsePayload<MessageItem>.self, endpoint: .chat("edit"),
      payload: EditRequest(
        messageId: messageId
      ))
  }

  public func forward(
    messageId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("forward"),
      payload: ForwardRequest(
        messageId: messageId
      ))
  }

  public func getChat(
    messageId: String
  ) async throws -> WAResponsePayload<Chat> {
    return try await api.post(
      WAResponsePayload<Chat>.self, endpoint: .chat("getChat"),
      payload: GetChatRequest(
        messageId: messageId
      ))
  }

  public func getContact(
    messageId: String
  ) async throws -> WAResponsePayload<Contact> {
    return try await api.post(
      WAResponsePayload<Contact>.self, endpoint: .chat("getContact"),
      payload: GetContactRequest(
        messageId: messageId
      ))
  }

  public func getInfo(
    messageId: String
  ) async throws -> WAResponsePayload<Contact> {
    return try await api.post(
      WAResponsePayload<Contact>.self, endpoint: .chat("getInfo"),
      payload: GetInfoRequest(
        messageId: messageId
      ))
  }

  public func getMentions(
    messageId: String
  ) async throws -> WAResponsePayload<[Contact]> {
    return try await api.post(
      WAResponsePayload<[Contact]>.self, endpoint: .chat("getMentions"),
      payload: GetMentionsRequest(
        messageId: messageId
      ))
  }

  public func getOrder(
    messageId: String
  ) async throws -> WAResponsePayload<Order> {
    return try await api.post(
      WAResponsePayload<Order>.self, endpoint: .chat("getOrder"),
      payload: GetOrderRequest(
        messageId: messageId
      ))
  }

  public func getPayment(
    messageId: String
  ) async throws -> WAResponsePayload<Payment> {
    return try await api.post(
      WAResponsePayload<Payment>.self, endpoint: .chat("getPayment"),
      payload: GetPaymentRequest(
        messageId: messageId
      ))
  }

  public func getQuotedMessage(
    messageId: String
  ) async throws -> WAResponsePayload<MessageItem> {
    return try await api.post(
      WAResponsePayload<MessageItem>.self, endpoint: .chat("getQuotedMessage"),
      payload: GetQuotedMessageRequest(
        messageId: messageId
      ))
  }

  public func getReactions(
    messageId: String
  ) async throws -> WAResponsePayload<[Reaction]> {
    return try await api.post(
      WAResponsePayload<[Reaction]>.self, endpoint: .chat("getReactions"),
      payload: GetReactionsRequest(
        messageId: messageId
      ))
  }

  public func react(
    messageId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("react"),
      payload: ReactRequest(
        messageId: messageId
      ))
  }

  public func reload(
    messageId: String
  ) async throws -> WAResponsePayload<MessageItem> {
    return try await api.post(
      WAResponsePayload<MessageItem>.self, endpoint: .chat("reload"),
      payload: ReloadRequest(
        messageId: messageId
      ))
  }

  public func reply(
    messageId: String
  ) async throws -> WAResponsePayload<MessageItem> {
    return try await api.post(
      WAResponsePayload<MessageItem>.self, endpoint: .chat("reply/message"),
      payload: ReplyRequest(
        messageId: messageId
      ))
  }

  public func sendMessage(
    priority: WaWebMessageManagerPriority,
    chatId: WhatsAppChatId,
    message: String,
    options: MessageSendOptions?
  ) async throws -> WAResponsePayload<WaWebMessageManagerItem> {
    return try await api.post(
      WAResponsePayload<WaWebMessageManagerItem>.self, endpoint: .message("send/message"),
      payload: SendMessageTextRequest(
        priority: priority,
        chatId: chatId,
        message: message,
        options: options
      ))
  }

  public func sendMessage(
    priority: WaWebMessageManagerPriority,
    chatId: WhatsAppChatId,
    media: MessageMedia,
    options: MessageSendOptions?
  ) async throws -> WAResponsePayload<WaWebMessageManagerItem> {
    return try await api.post(
      WAResponsePayload<WaWebMessageManagerItem>.self, endpoint: .message("send/media"),
      payload: SendMessageMediaRequest(
        priority: priority,
        chatId: chatId,
        media: media,
        url: nil,
        options: options
      ))
  }

  public func sendMessage(
    priority: WaWebMessageManagerPriority,
    chatId: WhatsAppChatId,
    mediaUrl: String,
    options: MessageSendOptions?
  ) async throws -> WAResponsePayload<WaWebMessageManagerItem> {
    return try await api.post(
      WAResponsePayload<WaWebMessageManagerItem>.self, endpoint: .message("send/media"),
      payload: SendMessageMediaRequest(
        priority: priority,
        chatId: chatId,
        media: nil,
        url: mediaUrl,
        options: options
      ))
  }

  public func sendMessage(
    priority: WaWebMessageManagerPriority,
    chatId: WhatsAppChatId,
    location: Location,
    options: MessageSendOptions?
  ) async throws -> WAResponsePayload<WaWebMessageManagerItem> {
    return try await api.post(
      WAResponsePayload<WaWebMessageManagerItem>.self, endpoint: .message("send/location"),
      payload: SendMessageLocationRequest(
        priority: priority,
        chatId: chatId,
        location: location,
        options: options
      ))
  }

  public func sendMessage(
    priority: WaWebMessageManagerPriority,
    chatId: WhatsAppChatId,
    poll: Poll,
    options: MessageSendOptions?
  ) async throws -> WAResponsePayload<WaWebMessageManagerItem> {
    return try await api.post(
      WAResponsePayload<WaWebMessageManagerItem>.self, endpoint: .message("send/poll"),
      payload: SendMessagePollRequest(
        priority: priority,
        chatId: chatId,
        poll: poll,
        options: options
      ))
  }

  public func star(
    messageId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("star"),
      payload: StarRequest(
        messageId: messageId
      ))
  }

  public func unstar(
    messageId: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .chat("unstar"),
      payload: UnstarRequest(
        messageId: messageId
      ))
  }

}
