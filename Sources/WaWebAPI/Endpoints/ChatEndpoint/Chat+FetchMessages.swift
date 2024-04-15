//
//  Chat+FetchMessages.swift
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
    
    public struct FetchMessagesRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        /// Options for searching messages. Right now only limit and fromMe is supported.
        public let searchOptions: SearchOptions
        
        public init(
            chatId: WhatsAppChatId,
            searchOptions: SearchOptions
        ) {
            self.chatId = chatId
            self.searchOptions = searchOptions
        }
        
    }
    
#if canImport(Vapor)
    /// Loads chat messages, sorted from earliest to latest.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/fetchMessages
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter searchOptions: SearchOptions
    /// - Returns: Promise containing Array of Message
    public func fetchMessages(
        chatId: WhatsAppChatId,
        searchOptions: SearchOptions
    ) throws -> EventLoopFuture<APIResponsePayload<[Message]>>{
        do {
            return try api.post( APIResponsePayload<[Message]>.self, endpoint: .chat("fetchMessages"), payload: FetchMessagesRequst(
                chatId: chatId,
                searchOptions: searchOptions
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
