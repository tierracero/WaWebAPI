//
//  Client+SendPresenceUnavailable.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {

    /// Marks the client as unavailable
    /// `POST` https://waweb.tierracero.co/api/v1/client/sendPresenceUnavailable
    /// - Returns: Promise containing void
    public func sendPresenceUnavailable() throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("sendPresenceUnavailable"))
        }
        catch {
            throw error
        }
    }
    
}
