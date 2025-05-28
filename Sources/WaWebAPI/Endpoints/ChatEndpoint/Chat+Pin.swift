//
//  Chat+Pin.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.PinRequst : Content {}

extension ChatEndpoint {
    
    /// Pin Requst
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/pin
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: New pin state. Could be false if the max number of pinned chats was reached.
    public func pin(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("pin"), payload: PinRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
