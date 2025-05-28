//
//  Client+GetChatLabels.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetChatLabelsRequest: Content {}

extension ClientEndpoint {
    
    /// Get all Labels assigned to a chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getChatLabels
    /// - Returns: Promise containing Array of Label
    public func getChatLabels(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponsePayload<[Label]>>{
        do {
            return try api.post(APIResponsePayload<[Label]>.self, endpoint: .client("getChatLabels"), payload: GetChatLabelsRequest(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }

}
