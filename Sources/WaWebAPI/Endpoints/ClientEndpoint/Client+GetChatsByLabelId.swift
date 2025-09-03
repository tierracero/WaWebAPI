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
    /// `POST` https://waweb.tierracero.co/api/v1/client/getChatsByLabelId
    /// - Returns: Promise containing Array of Chat
    public func getChatsByLabelId(
        labelId: String
    ) throws -> EventLoopFuture<WAResponsePayload<[Chat]>>{
        do {
            return try api.post(WAResponsePayload<[Chat]>.self, endpoint: .client("getChatsByLabelId"), payload: GetChatsByLabelIdRequest(
                labelId: labelId
            ))
        }
        catch {
            throw error
        }
    }
    
}
