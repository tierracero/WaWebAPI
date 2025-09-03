//
//  Client+CreateGroup.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.CreateGroupRequest: Content {}

extension ClientEndpoint {
    
    /// Creates a new group
    /// `POST` https://waweb.tierracero.co/api/v1/client/createGroup
    /// - Parameter inviteCode: String
    /// - Returns: Promise containing Boolean
    public func createGroup(
        title: String,
        participants: [WhatsAppChatId],
        options: CreateGroupOptions
    ) throws -> EventLoopFuture<APIResponsePayload<CreateGroupResult>>{
        do {
            return try api.post(APIResponsePayload<CreateGroupResult>.self, endpoint: .client("createGroup"), payload: CreateGroupRequest(
                title: title,
                participants: participants,
                options: options
            ))
        }
        catch {
            throw error
        }
    }

}
