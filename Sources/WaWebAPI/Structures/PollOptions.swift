//
//  PollOptions.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation

public struct PollOptions: Codable {
    
    public let name: String
    
    public let localId: Int
    
    public init(
        name: String,
        localId: Int
    ) {
        self.name = name
        self.localId = localId
    }
    
}
