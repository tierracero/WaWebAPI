//
//  Client+IsRegisteredUser.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.IsRegisteredUserRequest: Content {}

extension ClientEndpoint {
    
    /// Check if a given ID is registered in whatsapp
    /// `POST` https://waweb.tierracero.co/api/v1/client/isRegisteredUser
    /// - Returns: Promise containing Boolean
    public func isRegisteredUser(
        id: String
    ) throws -> EventLoopFuture<WAResponsePayload<IsRegisteredUserResponse>>{
        do {
            return try api.post(WAResponsePayload<IsRegisteredUserResponse>.self, endpoint: .client("isRegisteredUser"), payload: IsRegisteredUserRequest(
                id: id
            ))
        }
        catch {
            throw error
        }
    }
    
}
