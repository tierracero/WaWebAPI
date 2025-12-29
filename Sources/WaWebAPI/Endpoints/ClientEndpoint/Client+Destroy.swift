//
//  Client+Destroy.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {
    /// Archives this chat
    /// `POST` https://waweb.tierracero.co/api/v1/client/destroy
    /// - Returns: Promise containing Boolean
    public func destroy() throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post(WAResponse.self, endpoint: .client("destroy"))
        }
        catch {
            throw error
        }
    }
    
}
