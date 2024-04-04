//
//  Chat+ClearState.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct ClearStateRequest: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        public init(
            chatId: ChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Stops typing or recording in chat immediately.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/clearState
    /// - Parameter chatId: ChatId
    /// - Returns: Promise containing Boolean
    public func clearState(
        chatId: ChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("clearState"), payload: ClearStateRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
