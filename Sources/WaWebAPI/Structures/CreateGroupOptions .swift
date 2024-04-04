//
//  CreateGroupOptions.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

/// An object that handles options for group creation
public struct CreateGroupOptions: Codable {
    
    /// The number of seconds for the messages to disappear in the group (0 by default, won't take an effect if the group is been creating with myself only)
    /// Defaults to 0.
    public var messageTimer: Int?
    
    /// The ID of a parent community group to link the newly created group with (won't take an effect if the group is been creating with myself only)
    public var parentGroupId: String?
    
    /// If true, the inviteV4 will be sent to those participants who have restricted others from being automatically added to groups, otherwise the inviteV4 won't be sent (true by default)
    /// Defaults to true.
    public var autoSendInviteV4: Bool?
    
    /// The comment to be added to an inviteV4 (empty string by default)
    /// Defaults to ''.
    public var comment: Int?
    
    public init(
        messageTimer: Int?,
        parentGroupId: String?,
        autoSendInviteV4: Bool?,
        comment: Int?
    ) {
        self.messageTimer = messageTimer
        self.parentGroupId = parentGroupId
        self.autoSendInviteV4 = autoSendInviteV4
        self.comment = comment
    }
    
}
