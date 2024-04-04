//
//  Client+GetContacts.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    /// Get all current contact instances
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getContacts
    /// - Returns: Promise containing Array of Contact
    public func getContacts() throws -> EventLoopFuture<APIResponsePayload<[Contact]>>{
        do {
            return try api.post(APIResponsePayload<[Contact]>.self, endpoint: .client("getContacts"))
        }
        catch {
            throw error
        }
    }
    
}
#endif
