//
//  Client+SetStatus.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.SetStatusRequest: Content {}

extension ClientEndpoint {
    
    /// Sets the current user's status message.
    /// `POST` https://waweb.tierracero.co/api/v1/client/setStatus
    /// - Returns: Promise containing boolean
    public func setStatus(
        status: String
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .client("setStatus"), payload: SetStatusRequest(
                status: status
            ))
        }
        catch {
            throw error
        }
    }
    
}
