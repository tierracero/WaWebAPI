//
//  Chat+Unarchive.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.UnarchiveRequst: Content {}

extension ChatEndpoint {
    
    /// Un-archives this chat
    /// `POST` https://waweb.tierracero.co/api/v1/chat/unarchive
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func unarchive(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("unarchive"), payload: UnarchiveRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }

}
