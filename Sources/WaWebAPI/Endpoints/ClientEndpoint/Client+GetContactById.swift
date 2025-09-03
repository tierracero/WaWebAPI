//
//  Client+GetContactById.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetContactByIdRequest: Content {}


extension ClientEndpoint {
    
    /// Gets the Contact's common groups with you. Returns empty array if you don't have any common group.
    /// `POST` https://waweb.tierracero.co/api/v1/client/getCommonGroups
    /// - Returns: Promise containing Array of WAWebJS.WhatsAppChatId
    public func getContactById(
        contactId: String
    ) throws -> EventLoopFuture<APIResponsePayload<Contact>>{
        do {
            return try api.post(APIResponsePayload<Contact>.self, endpoint: .client("getContactById"), payload: GetContactByIdRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
