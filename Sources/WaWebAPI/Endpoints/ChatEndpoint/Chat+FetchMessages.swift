//
//  Chat+FetchMessages.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.FetchMessagesRequst : @retroactive Content {}

extension ChatEndpoint {
    
    /// Loads chat messages, sorted from earliest to latest.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/fetchMessages
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter searchOptions: SearchOptions
    /// - Returns: Promise containing Array of Message
    public func fetchMessages(
        chatId: WhatsAppChatId,
        searchOptions: SearchOptions
    ) throws -> EventLoopFuture<APIResponsePayload<[MessageItem]>>{
        do {
            return try api.post( APIResponsePayload<[MessageItem]>.self, endpoint: .chat("fetchMessages"), payload: FetchMessagesRequst(
                chatId: chatId,
                searchOptions: searchOptions
            ))
        }
        catch {
            throw error
        }
    }
    
}
