//
//  Client+GetBlockedContacts.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {

    /// Gets all blocked contacts by host account
    /// `POST` https://waweb.tierracero.co/api/v1/client/getBlockedContacts
    /// - Returns: Gets all blocked contacts by host account
    public func getBlockedContacts() throws -> EventLoopFuture<APIResponsePayload<[Contact]>>{
        do {
            return try api.post(APIResponsePayload<[Contact]>.self, endpoint: .client("getBlockedContacts"))
        }
        catch {
            throw error
        }
    }
    
}
