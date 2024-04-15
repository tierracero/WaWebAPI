//
//  Chat+Delete.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ChatEndpoint {
    
    public struct DeleteRequest: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public init(
            chatId: WhatsAppChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
#if canImport(Vapor)
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
#endif
    
}
