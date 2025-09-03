//
//  Chat+GetLabels.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.GetLabelsRequst : Content {}

extension ChatEndpoint {
    
    /// Returns array of all Labels assigned to this Chat
    /// `POST` https://waweb.tierracero.co/api/v1/chat/getLabels
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Array of Label
    public func getLabels(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponsePayload<[Label]>>{
        do {
            return try api.post( APIResponsePayload<[Label]>.self, endpoint: .chat("getLabels"), payload: GetLabelsRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
