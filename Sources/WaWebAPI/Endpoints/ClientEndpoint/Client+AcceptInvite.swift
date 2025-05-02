//
//  Client+AcceptInvite.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.AcceptInviteRequest : @retroactive Content {}

extension ClientEndpoint {
    
    /// Archives this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/acceptInvite
    /// - Parameter inviteCode: String
    /// - Returns: Promise containing Boolean
    public func acceptInvite(
        inviteCode: String
    ) throws -> EventLoopFuture<APIResponsePayload<AcceptInviteResponse>>{
        do {
            return try api.post(APIResponsePayload<AcceptInviteResponse>.self, endpoint: .client("acceptInvite"), payload: AcceptInviteRequest(
                inviteCode: inviteCode
            ))
        }
        catch {
            throw error
        }
    }

}
