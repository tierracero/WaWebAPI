//
//  Chat+Mute.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.MuteRequst : Content {}

extension ChatEndpoint {
    
    /// Mutes this chat forever, unless a date is specified
    /// `POST` https://waweb.tierracero.co/api/v1/chat/mute
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter unmuteDate: Int64?
    /// - Returns: Promise containing Boolean
    public func mute(
        chatId: WhatsAppChatId,
        unmuteDate: Int64?
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("mute"), payload: MuteRequst(
                chatId: chatId,
                unmuteDate: unmuteDate
            ))
        }
        catch {
            throw error
        }
    }
    
}
