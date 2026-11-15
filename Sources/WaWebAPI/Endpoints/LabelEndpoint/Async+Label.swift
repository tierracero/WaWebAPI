import Foundation
import TCFoundation
import TCFundamentals
import Vapor
import WaWebAPICore

extension LabelEndpoint {

  public func getChats(
    lableId: String
  ) async throws -> WAResponsePayload<[Chat]> {
    return try await api.post(
      WAResponsePayload<[Chat]>.self, endpoint: .label("getChats"),
      payload: GetChatsRequst(
        lableId: lableId
      ))
  }

}
