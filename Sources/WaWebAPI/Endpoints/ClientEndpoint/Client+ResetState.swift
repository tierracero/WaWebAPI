//
//  Client+ResetState.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ClientEndpoint {
    
#if canImport(Vapor)
    /// Logs out the client, closing the current session
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/resetState
    /// - Returns: Promise containing void
    public func resetState() throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("resetState"))
        }
        catch {
            throw error
        }
    }
#endif
    
}
