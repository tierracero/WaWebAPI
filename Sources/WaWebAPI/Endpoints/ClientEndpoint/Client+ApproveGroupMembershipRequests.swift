//
//  Client+ApproveGroupMembershipRequests.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct ApproveGroupMembershipRequests: CrossPlatformContent {
        
        public let groupId: String
        
        public let options: MembershipRequestActionOptions
        
        public init(
            groupId: String,
            options: MembershipRequestActionOptions
        ) {
            self.groupId = groupId
            self.options = options
        }
    }
    
    /// Approves membership requests if any.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/approveGroupMembershipRequests
    /// - Parameter inviteCode: String
    /// - Returns: [MembershipRequestActionResult] Returns an array of requester IDs whose membership requests were approved and an error for each requester, if any occurred during the operation. If there are no requests, an empty array will be returned.
    public func approveGroupMembershipRequests(
        groupId: String,
        options: MembershipRequestActionOptions
    ) throws -> EventLoopFuture<APIResponsePayload<[MembershipRequestActionResult]>>{
        do {
            return try api.post(APIResponsePayload<[MembershipRequestActionResult]>.self, endpoint: .client("approveGroupMembershipRequests"), payload: ApproveGroupMembershipRequests(
                groupId: groupId,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
