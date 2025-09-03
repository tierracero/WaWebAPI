//
//  Client+RejectGroupMembershipRequests.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.RejectGroupMembershipRequestsRequest: Content {}


extension ClientEndpoint {
    
    /// Rejects membership requests if any
    /// `POST` https://waweb.tierracero.co/api/v1/client/rejectGroupMembershipRequests
    /// - Returns: Promise containing Array of MembershipRequestActionResult,  whose membership requests were rejected and an error for each requester, if any occurred during the operation. If there are no requests, an empty array will be returned
    public func rejectGroupMembershipRequests(
        groupId: WhatsAppChatId,
        options: MembershipRequestActionOptions
    ) throws -> EventLoopFuture<WAResponsePayload<MembershipRequestActionOptions>>{
        do {
            return try api.post(WAResponsePayload<MembershipRequestActionOptions>.self, endpoint: .client("rejectGroupMembershipRequests"), payload: RejectGroupMembershipRequestsRequest(
                groupId: groupId,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
}

