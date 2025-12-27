//
//  Instance+Stop.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/27/25.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension InstanceEndpoint.StopRequest: Content {}

extension InstanceEndpoint {
    
    /// Stops inatce container
    /// `POST` https://waweb.tierracero.co/api/v1/instance/stop
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func stop(
        containerId: String
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .instance("stop"), payload: StopRequest(
                containerId: containerId
            ))
        }
        catch {
            throw error
        }
    }
    
}

