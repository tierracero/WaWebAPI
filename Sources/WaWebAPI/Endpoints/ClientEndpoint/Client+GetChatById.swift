//
//  Client+GetChatById.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct GetChatByIdRequest: CrossPlatformContent {
        
        public let chatId: ChatId
        
        public init(
            chatId: ChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Get chat instance by ID
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getChatById
    /// - Returns: Promise containing Chat
    public func getChatById(
        chatId: ChatId
    ) throws -> EventLoopFuture<APIResponsePayload<Chat>>{
        do {
            return try api.post(APIResponsePayload<Chat>.self, endpoint: .client("getChatById"), payload: GetChatByIdRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
