//
//  GroupMembershipRequest.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation

/// An object that handles the information about the group membership request
public struct GroupMembershipRequest: Codable {
    
    /// The wid of a user who requests to enter the group
    public let id: ContactId
    
    /// The wid of a user who created that request
    public let addedBy: ContactId
    
    /// The wid of a community parent group to which the current group is linked
    public let parentGroupId: ContactId?
    
    // The method used to create the request: NonAdminAdd/InviteLink/LinkedGroupJoin
    public let requestMethod: String
    
    // The timestamp the request was created at
    public let t: Int64
    
}
