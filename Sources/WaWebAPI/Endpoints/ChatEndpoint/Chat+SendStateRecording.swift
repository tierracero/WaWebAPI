//
//  Chat+SendStateRecording.swift
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
    
    public struct SendStateRecordingRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public init(
            chatId: WhatsAppChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
#if canImport(Vapor)
    /// Simulate recording audio in chat. This will last for 25 seconds.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/sendStateRecording
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func sendStateRecording(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("sendStateRecording"), payload: SendStateRecordingRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
