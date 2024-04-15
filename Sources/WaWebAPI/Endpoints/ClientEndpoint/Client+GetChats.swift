//
//  Client+GetChats.swift
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
    /// Get all current chat instances
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getChats
    /// - Returns: romise containing Array of Chat
    public func getChats() throws -> EventLoopFuture<APIResponsePayload<[Chat]>>{
        do {
            return try api.post(APIResponsePayload<[Chat]>.self, endpoint: .client("getChats"))
        }
        catch {
            throw error
        }
    }
#endif
    
}
