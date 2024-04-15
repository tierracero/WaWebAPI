//
//  Client+GetGroupMembershipRequests.swift
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
    
    public struct GetGroupMembershipRequests: CrossPlatformContent {
        
        /// The ID of a group to get membership requests for
        public let groupId: String
        
        public init(
            groupId: String
        ) {
            self.groupId = groupId
        }
    }
    
#if canImport(Vapor)
    /// Gets an array of membership requests
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getGroupMembershipRequests
    /// - Returns: Promise containing Array of GroupMembershipRequest
    public func getGroupMembershipRequests(
        groupId: String
    ) throws -> EventLoopFuture<APIResponsePayload<[GroupMembershipRequest]>>{
        do {
            return try api.post(APIResponsePayload<[GroupMembershipRequest]>.self, endpoint: .client("getGroupMembershipRequests"), payload: GetGroupMembershipRequests(
                groupId: groupId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
