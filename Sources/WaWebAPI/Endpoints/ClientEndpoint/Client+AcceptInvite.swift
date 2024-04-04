//
//  Client+AcceptInvite.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct AcceptInviteRequest: CrossPlatformContent {
        
        /// EG: 1234567890
        public let inviteCode: String
        
        public init(
            inviteCode: String
        ) {
            self.inviteCode = inviteCode
        }
    }
    
    
    public struct AcceptInviteResponse: Codable {
        
        /// EG: 1234567890
        public let chatId: ChatId
        
    }
    
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
#endif
