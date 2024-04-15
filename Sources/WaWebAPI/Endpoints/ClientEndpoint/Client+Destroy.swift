//
//  Client+Destroy.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ClientEndpoint {
    
#if canImport(Vapor)
    /// Archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/destroy
    /// - Returns: Promise containing Boolean
    public func destroy() throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("destroy"))
        }
        catch {
            throw error
        }
    }
#endif
    
}
