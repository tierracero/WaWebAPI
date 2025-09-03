//
//  Chat+SendStateTyping.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.SendStateTypingRequst: Content{}

extension ChatEndpoint {
    
    /// Simulate typing in chat. This will last for 25 seconds.
    /// `POST` https://waweb.tierracero.co/api/v1/chat/sendStateTyping
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func sendStateTyping(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("sendStateTyping"), payload: SendStateTypingRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }

}
