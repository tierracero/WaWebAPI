//
//  Client+AddOrRemoveLabels.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct AddOrRemoveLabelsRequest: CrossPlatformContent {
        
        public let labelIds: [String]
        
        /// EG: 1234567890
        public let chatIds: [WhatsAppChatId]
        
        public init(
            labelIds: [String],
            chatIds: [WhatsAppChatId]
        ) {
            self.labelIds = labelIds
            self.chatIds = chatIds
        }
    }
    
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
#endif
