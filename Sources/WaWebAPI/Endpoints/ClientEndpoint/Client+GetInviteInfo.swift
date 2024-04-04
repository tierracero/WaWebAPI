//
//  Client+GetInviteInfo.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct GetInviteInfoRequests: CrossPlatformContent {
        
        public let inviteCode: String
        
        public init(
            inviteCode: String
        ) {
            self.inviteCode = inviteCode
        }
    }
    
    /// Returns an object with information about the invite code's group
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getInviteInfo
    /// - Returns: Invite information
    public func getInviteInfo(
        inviteCode: String
    ) throws -> EventLoopFuture<APIResponsePayload<String>>{
        do {
            return try api.post(APIResponsePayload<String>.self, endpoint: .client("getInviteInfo"), payload: GetInviteInfoRequests(
                inviteCode: inviteCode
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
