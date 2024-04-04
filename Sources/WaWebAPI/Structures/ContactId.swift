//
//  ContactId.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation

public struct ContactId: Codable {
    
    public let serialized: String
    
    public let server: String
    
    public let user: String
    
    enum CodingKeys: String, CodingKey {
        case serialized = "_serialized"
        case server
        case user
    }

}
