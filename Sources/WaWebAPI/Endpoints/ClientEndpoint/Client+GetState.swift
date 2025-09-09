//
//  Client+GetState.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetStateResponse: Content {}

extension ClientEndpoint {
    
    /// Gets the current connection state for the client
    /// `POST` https://waweb.tierracero.co/api/v1/client/getState
    /// - Returns: Promise containing WAState
    public func getState() throws -> EventLoopFuture<WAResponsePayload<GetStateResponse>>{
        do {
            return try api.post(WAResponsePayload<GetStateResponse>.self, endpoint: .client("getState"))
        }
        catch {
            throw error
        }
    }
    
}
