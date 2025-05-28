//
//  Client+GetChatsByLabelId.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetChatsByLabelIdRequest: Content {}


extension ClientEndpoint {
    
    /// Get all Chats for a specific Label
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getChatsByLabelId
    /// - Returns: Promise containing Array of Chat
    public func getChatsByLabelId(
        labelId: String
    ) throws -> EventLoopFuture<APIResponsePayload<[Chat]>>{
        do {
            return try api.post(APIResponsePayload<[Chat]>.self, endpoint: .client("getChatsByLabelId"), payload: GetChatsByLabelIdRequest(
                labelId: labelId
            ))
        }
        catch {
            throw error
        }
    }
    
}
