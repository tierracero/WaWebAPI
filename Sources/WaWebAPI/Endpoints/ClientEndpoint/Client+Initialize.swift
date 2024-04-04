//
//  Client+Initialize.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    /// Sets up events and requirements, kicks off authentication request
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getWWebVersion
    /// - Returns: Promise containing void
    public func initialize() throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("initialize"))
        }
        catch {
            throw error
        }
    }
    
}
#endif
