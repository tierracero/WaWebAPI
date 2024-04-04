//
//  Chat.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation

public struct Chat: Codable {
    
    public let id: ContactId
    
    public let archived: Bool
 
    public let isGroup: Bool
    
    public let lastMessage: Message?
    
    public let muteExpiration: Int

    public let name: String
    
    public let pinned: Bool
    
    public let timestamp: Int64
    
    public let unreadCount: Int
    
}
