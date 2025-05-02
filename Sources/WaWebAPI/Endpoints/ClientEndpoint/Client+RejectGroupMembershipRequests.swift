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

extension ClientEndpoint.RejectGroupMembershipRequestsRequest: @retroactive Content {}


extension ClientEndpoint {
    
    /// Rejects membership requests if any
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/rejectGroupMembershipRequests
    /// - Returns: Promise containing Array of MembershipRequestActionResult,  whose membership requests were rejected and an error for each requester, if any occurred during the operation. If there are no requests, an empty array will be returned
    public func rejectGroupMembershipRequests(
        groupId: WhatsAppChatId,
        options: MembershipRequestActionOptions
    ) throws -> EventLoopFuture<APIResponsePayload<MembershipRequestActionOptions>>{
        do {
            return try api.post(APIResponsePayload<MembershipRequestActionOptions>.self, endpoint: .client("rejectGroupMembershipRequests"), payload: RejectGroupMembershipRequestsRequest(
                groupId: groupId,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
}

