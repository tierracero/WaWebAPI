//
//  Contact+Block.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ContactEndpoint.BlockRequest: Content {}

extension ContactEndpoint {
    
    /// Blocks this contact from WhatsApp
    /// `POST` https://waweb.tierracero.co/api/v1/contact/block
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func acceptInvite(
        contactId: String
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .client("block"), payload: BlockRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
