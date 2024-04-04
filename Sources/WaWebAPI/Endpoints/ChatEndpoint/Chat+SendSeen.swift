//
//  Chat+SendSeen.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct SendSeenRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        public init(
            chatId: ChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Set the message as seen
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/sendSeen
    /// - Parameter chatId: ChatId
    /// - Returns: Promise containing Boolean 
    public func sendSeen(
        chatId: ChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("sendSeen"), payload: SendSeenRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
