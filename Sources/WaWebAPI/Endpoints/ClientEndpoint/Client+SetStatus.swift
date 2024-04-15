//
//  Client+SetStatus.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ClientEndpoint {
    
    public struct SetStatusRequest: CrossPlatformContent {
        
        /// New status message
        public let status: String
        
        public init(
            status: String
        ) {
            self.status = status
        }
        
    }
    
#if canImport(Vapor)
    /// Sets the current user's status message.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/setStatus
    /// - Returns: Promise containing boolean
    public func setStatus(
        status: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("setStatus"), payload: SetStatusRequest(
                status: status
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
