//
//  MessageIdentifier.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation

public struct MessageIdentifier: Codable {
    
    public let serialized: String
    
    public let fromMe: Bool
    
    public let id: String
    
    public let remote: String

    enum CodingKeys: String, CodingKey {
        case serialized = "_serialized"
        case fromMe = "fromMe"
        case id = "id"
        case remote = "remote"
    }

    public init(
        serialized: String,
        fromMe: Bool,
        id: String,
        remote: String
    ) {
        self.serialized = serialized
        self.fromMe = fromMe
        self.id = id
        self.remote = remote
    }
}
