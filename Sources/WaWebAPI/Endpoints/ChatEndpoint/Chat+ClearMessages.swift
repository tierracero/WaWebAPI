//
//  Chat+ClearMessages.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.ClearMessagesRequest : Content {}

extension ChatEndpoint {
    
    /// Clears all messages from the chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/clearMessages
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func clearMessages(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("clearMessages"), payload: ClearMessagesRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }

}

