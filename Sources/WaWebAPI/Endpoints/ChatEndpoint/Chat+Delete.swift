//
//  Chat+Delete.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.DeleteRequest : @retroactive Content {}

extension ChatEndpoint {
    
    /// Deletes the chat.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/delete
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func delete(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("delete"), payload: DeleteRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
