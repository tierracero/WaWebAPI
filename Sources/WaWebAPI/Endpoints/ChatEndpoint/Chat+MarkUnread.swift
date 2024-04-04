//
//  Chat+MarkUnread.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct MarkUnreadRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public init(
            chatId: WhatsAppChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Mark this chat as unread
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/markUnread
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func markUnread(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("markUnread"), payload: MarkUnreadRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
