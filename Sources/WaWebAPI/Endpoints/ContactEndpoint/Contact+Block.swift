//
//  Contact+Block.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ContactEndpoint {
    
    public struct BlockRequest: CrossPlatformContent {
        
        /// EG: 1234567890
        public let contactId: String
        
        public init(
            contactId: String
        ) {
            self.contactId = contactId
        }
    }
    
    /// Blocks this contact from WhatsApp
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/block
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func acceptInvite(
        contactId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("block"), payload: BlockRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
