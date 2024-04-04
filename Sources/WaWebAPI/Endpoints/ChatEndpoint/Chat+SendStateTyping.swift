//
//  Chat+SendStateTyping.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct SendStateTypingRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        public init(
            chatId: ChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Simulate typing in chat. This will last for 25 seconds.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/sendStateTyping
    /// - Parameter chatId: ChatId
    /// - Returns: Promise containing Boolean
    public func sendStateTyping(
        chatId: ChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("sendStateTyping"), payload: SendStateTypingRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
