//
//  Client+GetChatLabels.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct GetChatLabelsRequest: CrossPlatformContent {
        
        public let chatId: ChatId
        
        public init(
            chatId: ChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
    /// Get all Labels assigned to a chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getChatLabels
    /// - Returns: Promise containing Array of Label
    public func getChatLabels(
        chatId: ChatId
    ) throws -> EventLoopFuture<APIResponsePayload<[Label]>>{
        do {
            return try api.post(APIResponsePayload<[Label]>.self, endpoint: .client("getChatLabels"), payload: GetChatLabelsRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
