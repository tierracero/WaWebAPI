//
//  Chat+GetContact.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.GetContactRequst : Content {}

extension ChatEndpoint {
    
    /// Returns the Contact that corresponds to this Chat.
    /// `POST` https://waweb.tierracero.co/api/v1/chat/getContact
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Contact
    public func getContact(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<WAResponsePayload<[Contact]>>{
        do {
            return try api.post( WAResponsePayload<[Contact]>.self, endpoint: .chat("getContact"), payload: GetContactRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
