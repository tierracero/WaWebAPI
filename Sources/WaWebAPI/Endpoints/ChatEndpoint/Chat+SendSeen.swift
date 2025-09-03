//
//  Chat+SendSeen.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.SendSeenRequst : Content {}

extension ChatEndpoint {
    
    /// Set the message as seen
    /// `POST` https://waweb.tierracero.co/api/v1/chat/sendSeen
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean 
    public func sendSeen(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("sendSeen"), payload: SendSeenRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
