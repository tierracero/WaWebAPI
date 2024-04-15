//
//  Chat+GetLabels.swift
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
    
    public struct GetLabelsRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public init(
            chatId: WhatsAppChatId
        ) {
            self.chatId = chatId
        }
        
    }
    
#if canImport(Vapor)
    /// Returns array of all Labels assigned to this Chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/getLabels
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Array of Label
    public func getLabels(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponsePayload<[Label]>>{
        do {
            return try api.post( APIResponsePayload<[Label]>.self, endpoint: .chat("getLabels"), payload: GetLabelsRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
