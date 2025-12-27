//
//  Instance+Start.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/27/25.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension InstanceEndpoint.StartRequest: Content {}

extension InstanceEndpoint {
    
    /// Trurn on instace container
    /// `POST` https://waweb.tierracero.co/api/v1/instance/start
    /// - Parameter containerId: String
    /// - Returns: Promise containing Boolean
    public func start(
        containerId: String
    ) throws -> EventLoopFuture<WaWebResponse>{
        do {
            return try api.post(WaWebResponse.self, endpoint: .instance("start"), payload: StartRequest(
                containerId: containerId
            ))
        }
        catch {
            throw error
        }
    }
    
}

