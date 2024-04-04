//
//  CoverPhoto.swift
//
//
//  Created by Victor Cantu on 3/3/24.
//

import Foundation

// MARK: - CoverPhoto
public struct CoverPhoto: Codable {
    
    public let id: String
    
    public let url: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case url
    }

    public init(
        id: String,
        url: [String]
    ) {
        self.id = id
        self.url = url
    }
}
