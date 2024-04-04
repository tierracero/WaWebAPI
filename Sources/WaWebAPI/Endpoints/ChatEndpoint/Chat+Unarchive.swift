//
//  Chat+Unarchive.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct UnarchiveRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public init(
            chatId: WhatsAppChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Un-archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/unarchive
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func unarchive(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("unarchive"), payload: UnarchiveRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
