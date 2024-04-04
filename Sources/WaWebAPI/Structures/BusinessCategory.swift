//
//  BusinessCategory.swift
//
//
//  Created by Victor Cantu on 3/3/24.
//

import Foundation

// MARK: - Category
public struct BusinessCategory: Codable {
    public let id: String
    public let localizedDisplayName: String

    enum CodingKeys: String, CodingKey {
        case id
        case localizedDisplayName = "localized_display_name"
    }

    public init(
        id: String,
        localizedDisplayName: String
    ) {
        self.id = id
        self.localizedDisplayName = localizedDisplayName
    }
}
