//
//  Client+GetContactDeviceCount.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetContactDeviceCountRequest: Content {}

extension ClientEndpoint {
    
    /// Get user device count by ID Each WaWeb Connection counts as one device, and the phone (if exists) counts as one So for a non-enterprise user with one WaWeb connection it should return "2"
    /// `POST` https://waweb.tierracero.co/api/v1/client/getContactDeviceCount
    /// - Returns: Promise containing number
    public func getContactDeviceCount(
        userId: String
    ) throws -> EventLoopFuture<WAResponsePayload<String>>{
        do {
            return try api.post(WAResponsePayload<String>.self, endpoint: .client("getContactDeviceCount"), payload: GetContactDeviceCountRequest(
                userId: userId
            ))
        }
        catch {
            throw error
        }
    }
    
}
