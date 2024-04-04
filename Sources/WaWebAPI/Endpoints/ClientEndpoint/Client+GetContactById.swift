//
//  Client+GetContactById.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct GetContactByIdRequest: CrossPlatformContent {
        
        public let contactId: String
        
        public init(
            contactId: String
        ) {
            self.contactId = contactId
        }
        
    }
    
    /// Gets the Contact's common groups with you. Returns empty array if you don't have any common group.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getCommonGroups
    /// - Returns: Promise containing Array of WAWebJS.ChatId
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
#endif
