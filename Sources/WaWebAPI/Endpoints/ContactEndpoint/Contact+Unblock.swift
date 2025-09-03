//
//  Contact+Unblock.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ContactEndpoint.UnblockRequest: Content {}

extension ContactEndpoint {
    
    /// Blocks this contact from WhatsApp
    /// `POST` https://waweb.tierracero.co/api/v1/contact/unblock
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
    
}

