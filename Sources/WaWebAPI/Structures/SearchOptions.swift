//
//  SearchOptions.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

public struct SearchOptions: Codable {
    
    public let limit: Int?
    
    public let fromMe: Bool?
    
    public let chatId: String?
    
    public init(
        limit: Int?,
        fromMe: Bool?,
        chatId: String?
    ) {
        self.limit = limit
        self.fromMe = fromMe
        self.chatId = chatId
    }
    
}
