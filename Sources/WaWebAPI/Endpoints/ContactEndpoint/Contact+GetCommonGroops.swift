//
//  Contact+GetCommonGroops.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ContactEndpoint {
    
    public struct GetCommonGroopsRequest: CrossPlatformContent {
        
        /// EG: 1234567890
        public let contactId: String
        
        public init(
            contactId: String
        ) {
            self.contactId = contactId
        }
    }
    
    
    /// Gets the Contact's common groups with you. Returns empty array if you don't have any common group.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/getCommonGroups
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func getCommonGroups(
        contactId: String
    ) throws -> EventLoopFuture<APIResponsePayload<[String]>>{
        do {
            return try api.post(APIResponsePayload<[String]>.self, endpoint: .client("getCommonGroups"), payload: GetCommonGroopsRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
