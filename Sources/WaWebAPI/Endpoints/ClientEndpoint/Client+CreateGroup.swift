//
//  Client+CreateGroup.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct CreateGroupRequest: CrossPlatformContent {
        
        /// Group title
        public let title: String
        
        /// A single Contact object or an ID as a string or an array of Contact objects or contact IDs to add to the group
        public let participants: [ChatId]
        
        /// An object that handles options for group creation
        public let options: CreateGroupOptions
        
        public init(
            title: String,
            participants: [ChatId],
            options: CreateGroupOptions
        ) {
            self.title = title
            self.participants = participants
            self.options = options
        }
    }
    
    /// Creates a new group
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/createGroup
    /// - Parameter inviteCode: String
    /// - Returns: Promise containing Boolean
    public func createGroup(
        title: String,
        participants: [ChatId],
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
#endif
