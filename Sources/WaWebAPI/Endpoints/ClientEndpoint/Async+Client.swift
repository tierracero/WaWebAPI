import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension ClientEndpoint {

  public func acceptInvite(
    inviteCode: String
  ) async throws -> WAResponsePayload<AcceptInviteResponse> {
    return try await api.post(
      WAResponsePayload<AcceptInviteResponse>.self, endpoint: .client("acceptInvite"),
      payload: AcceptInviteRequest(
        inviteCode: inviteCode
      ))
  }

  public func addOrRemoveLabels(
    labelIds: [String],
    chatIds: [WhatsAppChatId]
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("addOrRemoveLabels"),
      payload: AddOrRemoveLabelsRequest(
        labelIds: labelIds,
        chatIds: chatIds
      ))
  }

  public func approveGroupMembershipRequests(
    groupId: String,
    options: MembershipRequestActionOptions
  ) async throws -> WAResponsePayload<[MembershipRequestActionResult]> {
    return try await api.post(
      WAResponsePayload<[MembershipRequestActionResult]>.self,
      endpoint: .client("approveGroupMembershipRequests"),
      payload: ApproveGroupMembershipRequests(
        groupId: groupId,
        options: options
      ))
  }

  public func createGroup(
    title: String,
    participants: [WhatsAppChatId],
    options: CreateGroupOptions
  ) async throws -> WAResponsePayload<CreateGroupResult> {
    return try await api.post(
      WAResponsePayload<CreateGroupResult>.self, endpoint: .client("createGroup"),
      payload: CreateGroupRequest(
        title: title,
        participants: participants,
        options: options
      ))
  }

  public func deleteProfilePicture() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("deleteProfilePicture"))
  }

  public func destroy() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("destroy"))
  }

  public func getBlockedContacts() async throws -> WAResponsePayload<[Contact]> {
    return try await api.post(
      WAResponsePayload<[Contact]>.self, endpoint: .client("getBlockedContacts"))
  }

  public func getChatById(
    chatId: WhatsAppChatId
  ) async throws -> WAResponsePayload<Chat> {
    return try await api.post(
      WAResponsePayload<Chat>.self, endpoint: .client("getChatById"),
      payload: GetChatByIdRequest(
        chatId: chatId
      ))
  }

  public func getChatLabels(
    chatId: WhatsAppChatId
  ) async throws -> WAResponsePayload<[Label]> {
    return try await api.post(
      WAResponsePayload<[Label]>.self, endpoint: .client("getChatLabels"),
      payload: GetChatLabelsRequest(
        chatId: chatId
      ))
  }

  public func getChats() async throws -> WAResponsePayload<[Chat]> {
    return try await api.post(WAResponsePayload<[Chat]>.self, endpoint: .client("getChats"))
  }

  public func getChatsByLabelId(
    labelId: String
  ) async throws -> WAResponsePayload<[Chat]> {
    return try await api.post(
      WAResponsePayload<[Chat]>.self, endpoint: .client("getChatsByLabelId"),
      payload: GetChatsByLabelIdRequest(
        labelId: labelId
      ))
  }

  public func getChatsByLabelId(
    contactId: String
  ) async throws -> WAResponsePayload<[WhatsAppChatId]> {
    return try await api.post(
      WAResponsePayload<[WhatsAppChatId]>.self, endpoint: .client("getCommonGroups"),
      payload: GetCommonGroupsRequest(
        contactId: contactId
      ))
  }

  public func getContactById(
    contactId: String
  ) async throws -> WAResponsePayload<Contact> {
    return try await api.post(
      WAResponsePayload<Contact>.self, endpoint: .client("getContactById"),
      payload: GetContactByIdRequest(
        contactId: contactId
      ))
  }

  public func getContactDeviceCount(
    userId: String
  ) async throws -> WAResponsePayload<String> {
    return try await api.post(
      WAResponsePayload<String>.self, endpoint: .client("getContactDeviceCount"),
      payload: GetContactDeviceCountRequest(
        userId: userId
      ))
  }

  public func getContactLidAndPhone(
    userIds: [String]
  ) async throws -> WAResponsePayload<[LidId]> {
    return try await api.post(
      WAResponsePayload<[LidId]>.self, endpoint: .client("getContactLidAndPhone"),
      payload: GetContactLidAndPhoneRequest(
        userIds: userIds
      ))
  }

  public func getContacts() async throws -> WAResponsePayload<[Contact]> {
    return try await api.post(
      WAResponsePayload<[Contact]>.self, endpoint: .client("getContacts"))
  }

  public func getCountryCode(
    mobile: String
  ) async throws -> WAResponsePayload<GetCountryCodeResponse> {
    return try await api.post(
      WAResponsePayload<GetCountryCodeResponse>.self, endpoint: .client("getCountryCode"),
      payload: GetCountryCodeRequest(
        mobile: mobile
      ))
  }

  public func getCustomerNote(
    userId: String
  ) async throws -> WAResponsePayload<CustomerNote> {
    return try await api.post(
      WAResponsePayload<CustomerNote>.self, endpoint: .client("getCustomerNote"),
      payload: GetCustomerNoteRequest(
        userId: userId
      ))
  }

  public func getFormattedNumber(
    mobile: String
  ) async throws -> WAResponsePayload<GetFormattedNumberResponse> {
    return try await api.post(
      WAResponsePayload<GetFormattedNumberResponse>.self, endpoint: .client("getFormattedNumber"),
      payload: GetFormattedNumberRequest(
        mobile: mobile
      ))
  }

  public func getGroupMembershipRequests(
    groupId: String
  ) async throws -> WAResponsePayload<[GroupMembershipRequest]> {
    return try await api.post(
      WAResponsePayload<[GroupMembershipRequest]>.self,
      endpoint: .client("getGroupMembershipRequests"),
      payload: GetGroupMembershipRequests(
        groupId: groupId
      ))
  }

  public func getInviteInfo(
    inviteCode: String
  ) async throws -> WAResponsePayload<String> {
    return try await api.post(
      WAResponsePayload<String>.self, endpoint: .client("getInviteInfo"),
      payload: GetInviteInfoRequests(
        inviteCode: inviteCode
      ))
  }

  public func getLabelById(
    labelId: String
  ) async throws -> WAResponsePayload<Label> {
    return try await api.post(
      WAResponsePayload<Label>.self, endpoint: .client("getLabelById"),
      payload: GetLabelByIdRequests(
        labelId: labelId
      ))
  }

  public func getNumberId(
    number: String
  ) async throws -> WAResponsePayload<String> {
    return try await api.post(
      WAResponsePayload<String>.self, endpoint: .client("getNumberId"),
      payload: GetNumberIdRequests(
        number: number
      ))
  }

  public func getProfilePicUrl(
    contactId: WhatsAppChatId
  ) async throws -> WAResponsePayload<String> {
    return try await api.post(
      WAResponsePayload<String>.self, endpoint: .client("getProfilePicUrl"),
      payload: GetProfilePicUrlRequests(
        contactId: contactId
      ))
  }

  public func getState() async throws -> WAResponsePayload<GetStateResponse> {
    return try await api.post(
      WAResponsePayload<GetStateResponse>.self, endpoint: .client("getState"))
  }

  public func getWWebVersion() async throws -> WAResponsePayload<String> {
    return try await api.post(
      WAResponsePayload<String>.self, endpoint: .client("getWWebVersion"))
  }

  public func initialize() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("initialize"))
  }

  public func isRegisteredUser(
    id: String
  ) async throws -> WAResponsePayload<IsRegisteredUserResponse> {
    return try await api.post(
      WAResponsePayload<IsRegisteredUserResponse>.self, endpoint: .client("isRegisteredUser"),
      payload: IsRegisteredUserRequest(
        id: id
      ))
  }

  public func logout() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("logout"))
  }

  public func rejectGroupMembershipRequests(
    groupId: WhatsAppChatId,
    options: MembershipRequestActionOptions
  ) async throws -> WAResponsePayload<MembershipRequestActionOptions> {
    return try await api.post(
      WAResponsePayload<MembershipRequestActionOptions>.self,
      endpoint: .client("rejectGroupMembershipRequests"),
      payload: RejectGroupMembershipRequestsRequest(
        groupId: groupId,
        options: options
      ))
  }

  public func resetState() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("resetState"))
  }

  public func searchMessages(
    query: String,
    option: SearchOptions?
  ) async throws -> WAResponsePayload<[MessageItem]> {
    return try await api.post(
      WAResponsePayload<[MessageItem]>.self, endpoint: .client("searchMessages"),
      payload: SearchMessagesRequest(
        query: query,
        option: option
      ))
  }

  public func sendPresenceAvailable() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("sendPresenceAvailable"))
  }

  public func sendPresenceUnavailable() async throws -> WAResponse {
    return try await api.post(WAResponse.self, endpoint: .client("sendPresenceUnavailable"))
  }

  public func setDisplayName(
    displayName: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("setDisplayName"),
      payload: SetDisplayNameRequest(
        displayName: displayName
      ))
  }

  public func setProfilePicture(
    media: MessageMedia
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("setProfilePicture"),
      payload: SetProfilePictureRequest(
        media: media
      ))
  }

  public func setStatus(
    status: String
  ) async throws -> WAResponse {
    return try await api.post(
      WAResponse.self, endpoint: .client("setStatus"),
      payload: SetStatusRequest(
        status: status
      ))
  }

}
