//
//  Chat+Unmute.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.UnmuteRequst: Content {}

extension ChatEndpoint {
    
    /// Unmutes this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/unmute
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func unmute(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("unmute"), payload: UnmuteRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
