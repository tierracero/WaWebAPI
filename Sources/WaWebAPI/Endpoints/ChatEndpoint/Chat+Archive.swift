//
//  Chat+Archive.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.ArchiveRequest: Content {}

extension ChatEndpoint {
    
    /// Archives this chat
    /// `POST` https://waweb.tierracero.co/api/v1/chat/archive
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func archive(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .chat("archive"), payload: ArchiveRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}

