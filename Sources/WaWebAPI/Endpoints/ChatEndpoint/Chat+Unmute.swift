//
//  Chat+Unmute.swift
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
    
    public struct UnmuteRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public init(
            chatId: WhatsAppChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
#if canImport(Vapor)
    /// Unmutes this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/unmute
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func unmute(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("unmute"), payload: UnmuteRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
