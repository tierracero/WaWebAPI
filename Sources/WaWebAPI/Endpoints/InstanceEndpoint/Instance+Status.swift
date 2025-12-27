//
//  Instance+Status.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/27/25.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension InstanceEndpoint.StatusRequest: Content {}

extension InstanceEndpoint {
    
    /// Stops inatce container
    /// `POST` https://waweb.tierracero.co/api/v1/instance/status
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func status(
        containerId: String
    ) throws -> EventLoopFuture<WaWebResponsePayload<StatusResponse>>{
        do {
            return try api.post(WaWebResponsePayload<StatusResponse>.self, endpoint: .instance("status"), payload: StopRequest(
                containerId: containerId
            ))
        }
        catch {
            throw error
        }
    }
    
}
