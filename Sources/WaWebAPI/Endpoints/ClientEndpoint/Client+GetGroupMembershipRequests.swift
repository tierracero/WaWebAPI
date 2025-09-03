//
//  Client+GetGroupMembershipRequests.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetGroupMembershipRequests: Content {}


extension ClientEndpoint {
    
    /// Gets an array of membership requests
    /// `POST` https://waweb.tierracero.co/api/v1/client/getGroupMembershipRequests
    /// - Returns: Promise containing Array of GroupMembershipRequest
    public func getGroupMembershipRequests(
        groupId: String
    ) throws -> EventLoopFuture<WAResponsePayload<[GroupMembershipRequest]>>{
        do {
            return try api.post(WAResponsePayload<[GroupMembershipRequest]>.self, endpoint: .client("getGroupMembershipRequests"), payload: GetGroupMembershipRequests(
                groupId: groupId
            ))
        }
        catch {
            throw error
        }
    }
    
}
