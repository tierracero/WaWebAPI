//
//  Chat+Delete.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.DeleteRequest : Content {}

extension ChatEndpoint {
    
    /// Deletes the chat.
    /// `POST` https://waweb.tierracero.co/api/v1/chat/delete
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func delete(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("delete"), payload: DeleteRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
