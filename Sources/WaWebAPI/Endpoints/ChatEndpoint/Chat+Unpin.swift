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
    /// `POST` https://waweb.tierracero.co/api/v1/chat/unpin
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func unpin(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("unpin"), payload: UnpinRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
