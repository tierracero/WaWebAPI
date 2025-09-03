//
//  Client+Logout.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {

    /// Logs out the client, closing the current session
    /// `POST` https://waweb.tierracero.co/api/v1/client/logout
    /// - Returns: Promise containing void
    public func logout() throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .client("logout"))
        }
        catch {
            throw error
        }
    }
    
}
