//
//  Chat+Unpin.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.UnpinRequst: Content {}

extension ChatEndpoint {

    /// Unpins this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/unpin
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func unpin(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("unpin"), payload: UnpinRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
