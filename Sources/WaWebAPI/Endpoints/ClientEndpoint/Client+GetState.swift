//
//  Client+GetState.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    /// Gets the current connection state for the client
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getState
    /// - Returns: Promise containing WAState
    public func getState() throws -> EventLoopFuture<APIResponsePayload<WAState>>{
        do {
            return try api.post(APIResponsePayload<WAState>.self, endpoint: .client("getState"))
        }
        catch {
            throw error
        }
    }
    
}
#endif
