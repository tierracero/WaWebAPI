//
//  Client+GetCommonGroups.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetCommonGroupsRequest: Content {}


extension ClientEndpoint {
    
    /// Gets the Contact's common groups with you. Returns empty array if you don't have any common group.
    /// `POST` https://waweb.tierracero.co/api/v1/client/getCommonGroups
    /// - Returns: Promise containing Array of WAWebJS.WhatsAppChatId
    public func getChatsByLabelId(
        contactId: String
    ) throws -> EventLoopFuture<WAResponsePayload<[WhatsAppChatId]>>{
        do {
            return try api.post(WAResponsePayload<[WhatsAppChatId]>.self, endpoint: .client("getCommonGroups"), payload: GetCommonGroupsRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
