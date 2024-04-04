//
//  Client+SendPresenceAvailable.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    /// Marks the client as online
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/sendPresenceAvailable
    /// - Returns: Promise containing void
    public func sendPresenceAvailable() throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("sendPresenceAvailable"))
        }
        catch {
            throw error
        }
    }
    
}
#endif

