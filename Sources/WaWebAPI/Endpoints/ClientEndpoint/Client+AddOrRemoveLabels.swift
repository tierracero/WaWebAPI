//
//  Client+AddOrRemoveLabels.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.AddOrRemoveLabelsRequest : Content {}

extension ClientEndpoint {
    
    /// Archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/addOrRemoveLabels
    /// - Parameter inviteCode: String
    /// - Returns: Promise containing Boolean
    public func addOrRemoveLabels(
        labelIds: [String],
        chatIds: [WhatsAppChatId]
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("addOrRemoveLabels"), payload: AddOrRemoveLabelsRequest(
                labelIds: labelIds,
                chatIds: chatIds
            ))
        }
        catch {
            throw error
        }
    }
}
