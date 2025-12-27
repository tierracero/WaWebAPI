//
//  Instance+Create.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/27/25.
//
import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension InstanceEndpoint.CreateRequest: Content {}

extension InstanceEndpoint {
    
    /// Stops inatce container
    /// `POST` https://waweb.tierracero.co/api/v1/instance/create
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func status(
        containerId: String,
        containerPort: Int
    ) throws -> EventLoopFuture<WaWebResponse>{
        do {
            return try api.post(WaWebResponse.self, endpoint: .instance("create"), payload: CreateRequest(
                containerId: containerId,
                containerPort: containerPort
            ))
        }
        catch {
            throw error
        }
    }
    
}
