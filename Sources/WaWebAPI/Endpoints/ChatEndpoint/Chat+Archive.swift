//
//  Chat+Archive.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct ArchiveRequest: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        public init(
            chatId: ChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/archive
    /// - Parameter chatId: ChatId
    /// - Returns: Promise containing Boolean
    public func archive(
        chatId: ChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .chat("archive"), payload: ArchiveRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
