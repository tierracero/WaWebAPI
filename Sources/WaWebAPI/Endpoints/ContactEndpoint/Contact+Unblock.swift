//
//  Contact+Unblock.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ContactEndpoint {
    
    public struct UnblockRequest: CrossPlatformContent {
        
        /// EG: 1234567890
        public let contactId: String
        
        public init(
            contactId: String
        ) {
            self.contactId = contactId
        }
    }
    
    public struct UnblockResponse: Codable {
        
        public let unblocked: Bool
        
        public init(
            unblocked: Bool
        ) {
            self.unblocked = unblocked
        }
        
    }
    
#if canImport(Vapor)
    /// Blocks this contact from WhatsApp
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/unblock
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func unblock(
        contactId: String
    ) throws -> EventLoopFuture<APIResponsePayload<UnblockResponse>>{
        do {
            return try api.post(APIResponsePayload<UnblockResponse>.self, endpoint: .client("unblock"), payload: UnblockRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}

