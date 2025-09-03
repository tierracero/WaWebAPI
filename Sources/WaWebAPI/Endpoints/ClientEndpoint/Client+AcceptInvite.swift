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

extension ClientEndpoint.AcceptInviteRequest : Content {}

extension ClientEndpoint {
    
    /// Archives this chat
    /// `POST` https://waweb.tierracero.co/api/v1/client/acceptInvite
    /// - Parameter inviteCode: String
    /// - Returns: Promise containing Boolean
    public func acceptInvite(
        inviteCode: String
    ) throws -> EventLoopFuture<WAResponsePayload<AcceptInviteResponse>>{
        do {
            return try api.post(WAResponsePayload<AcceptInviteResponse>.self, endpoint: .client("acceptInvite"), payload: AcceptInviteRequest(
                inviteCode: inviteCode
            ))
        }
        catch {
            throw error
        }
    }

}
