//
//  Chat+Mute.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct MuteRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        /// Date at which the Chat will be unmuted, leave as is to mute forever.
        public let unmuteDate: Int64?
        
        public init(
            chatId: WhatsAppChatId,
            unmuteDate: Int64?
        ) {
            self.chatId = chatId
            self.unmuteDate = unmuteDate
        }
        
    }
    
    /// Mutes this chat forever, unless a date is specified
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/mute
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter unmuteDate: Int64?
    /// - Returns: Promise containing Boolean
    public func mute(
        chatId: WhatsAppChatId,
        unmuteDate: Int64?
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("mute"), payload: MuteRequst(
                chatId: chatId,
                unmuteDate: unmuteDate
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
