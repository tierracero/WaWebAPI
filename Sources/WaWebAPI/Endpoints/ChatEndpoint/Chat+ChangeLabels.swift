//
//  Chat+ChangeLabels.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.ChangeLabelsRequest : Content {}

extension ChatEndpoint {
    
    /// Archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/archive
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func changeLabels(
        chatId: WhatsAppChatId,
        labelIds: String
    ) throws -> EventLoopFuture<APIResponse>{
     
        do {
            return try api.post( APIResponse.self, endpoint: .chat("changeLabels"), payload: ChangeLabelsRequest(
                chatId: chatId,
                labelIds: labelIds
            ))
        }
        catch {
            throw error
        }
    }
    
}

