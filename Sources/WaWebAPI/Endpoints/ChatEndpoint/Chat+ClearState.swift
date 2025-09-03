//
//  Chat+ClearState.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.ClearStateRequest : Content {}

extension ChatEndpoint {
    
    /// Stops typing or recording in chat immediately.
    /// `POST` https://waweb.tierracero.co/api/v1/chat/clearState
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func clearState(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("clearState"), payload: ClearStateRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}

