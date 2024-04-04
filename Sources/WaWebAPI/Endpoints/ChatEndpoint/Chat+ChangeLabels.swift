//
//  Chat+ChangeLabels.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ChatEndpoint {
    
    public struct ChangeLabelsRequest: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        /// Array of (number or string)
        public let labelIds: String
        
        public init(
            chatId: ChatId,
            labelIds: String
        ) {
            self.chatId = chatId
            self.labelIds = labelIds
        }
        
    }
    
    /// Archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/archive
    /// - Parameter chatId: ChatId
    /// - Returns: Promise containing Boolean
    public func changeLabels(
        chatId: ChatId,
        labelIds: String
    ) throws -> EventLoopFuture<APIResponse>{
     
        do {
            return try api.post( APIResponse.self, endpoint: .chat("changeLabels"), payload: ChangeLabelsRequest(                                 
                chatId: chatId,
                labelIds: labelIds
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
