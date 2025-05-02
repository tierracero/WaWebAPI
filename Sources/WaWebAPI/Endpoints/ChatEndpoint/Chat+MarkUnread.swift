//
//  Chat+MarkUnread.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.MarkUnreadRequst : @retroactive Content {}

extension ChatEndpoint {
    
    /// Mark this chat as unread
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/markUnread
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func markUnread(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("markUnread"), payload: MarkUnreadRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
