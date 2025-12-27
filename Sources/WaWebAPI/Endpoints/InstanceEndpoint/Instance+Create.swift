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
    
    // TODO: Implement this fucntion for public usr, rightnoe create dirctrly
    
    /// Stops inatce container
    /// `POST` https://waweb.tierracero.co/api/v1/instance/create
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func status(
        containerId: String,
        containerPort: Int
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .instance("create"), payload: CreateRequest(
                containerId: containerId,
                containerPort: containerPort
            ))
        }
        catch {
            throw error
        }
    }
    
}
