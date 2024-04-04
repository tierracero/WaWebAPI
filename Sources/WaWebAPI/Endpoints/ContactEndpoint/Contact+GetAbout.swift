//
//  Contact+GetAbout.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ContactEndpoint {
    
    public struct GetAboutRequest: CrossPlatformContent {
        
        /// EG: 1234567890
        public let contactId: String
        
        public init(
            contactId: String
        ) {
            self.contactId = contactId
        }
    }
    
    /// Gets the Contact's current "about" info. Returns null if you don't have permission to read their status.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/getAbout
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func getAbout(
        contactId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("getAbout"), payload: GetAboutRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
