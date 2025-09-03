//
//  Client+GetChatById.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetChatByIdRequest: Content {}


extension ClientEndpoint {
    /// Get chat instance by ID
    /// `POST` https://waweb.tierracero.co/api/v1/client/getChatById
    /// - Returns: Promise containing Chat
    public func getChatById(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponsePayload<Chat>>{
        do {
            return try api.post(WAResponsePayload<Chat>.self, endpoint: .client("getChatById"), payload: GetChatByIdRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
   
}
