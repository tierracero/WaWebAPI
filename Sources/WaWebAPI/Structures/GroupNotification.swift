//
//  GroupNotification.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation

public struct GroupNotification: Codable {
    
    /// ContactId for the user that produced the GroupNotification.
    public let author: String
    
    /// Extra content
    public let body: String
    
    /// ID for the Chat that this groupNotification was sent for.
    public let chatId: ContactId
    
    /// ID that represents the groupNotification
    public let id: ContactId
    
    /// Contact IDs for the users that were affected by this GroupNotification.
    public let recipientIds: [ContactId]
    
    public let timestamp: Int64
    
    public let type: GroupNotificationTypes
    
}
