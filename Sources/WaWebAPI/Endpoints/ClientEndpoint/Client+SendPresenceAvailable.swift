//
//  Client+SendPresenceAvailable.swift
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

    /// Marks the client as online
    /// `POST` https://waweb.tierracero.co/api/v1/client/sendPresenceAvailable
    /// - Returns: Promise containing void
    public func sendPresenceAvailable() throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .client("sendPresenceAvailable"))
        }
        catch {
            throw error
        }
    }
    
}

