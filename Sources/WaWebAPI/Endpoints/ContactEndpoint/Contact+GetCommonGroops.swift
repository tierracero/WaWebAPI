//
//  Contact+GetCommonGroops.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ContactEndpoint.GetCommonGroopsRequest: Content {}

extension ContactEndpoint {
    
    /// Gets the Contact's common groups with you. Returns empty array if you don't have any common group.
    /// `POST` https://waweb.tierracero.co/api/v1/contact/getCommonGroups
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
