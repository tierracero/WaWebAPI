//
//  Client+IsRegisteredUser.swift
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
    
    public struct IsRegisteredUserRequest: CrossPlatformContent {
        
        /// the whatsapp user's ID
        public let id: String
        
        public init(
            id: String
        ) {
            self.id = id
        }
    }
    
    public struct IsRegisteredUserResponse: CrossPlatformContent {
        public let isRegisteredUser: Bool
    }
    
#if canImport(Vapor)
    /// Check if a given ID is registered in whatsapp
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/isRegisteredUser
    /// - Returns: Promise containing Boolean
    public func isRegisteredUser(
        id: String
    ) throws -> EventLoopFuture<APIResponsePayload<IsRegisteredUserResponse>>{
        do {
            return try api.post(APIResponsePayload<IsRegisteredUserResponse>.self, endpoint: .client("isRegisteredUser"), payload: IsRegisteredUserRequest(
                id: id
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
