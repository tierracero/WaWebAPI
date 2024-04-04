//
//  ProfileOptions.swift
//  
//
//  Created by Victor Cantu on 3/3/24.
//

import Foundation

// MARK: - ProfileOptions
public struct ProfileOptions: Codable {
    
    public let cartEnabled: Bool
    
    public let commerceExperience: CommerceExperienceType

    enum CodingKeys: String, CodingKey {
        case cartEnabled = "cartEnabled"
        case commerceExperience = "commerceExperience"
    }

    public init(
        cartEnabled: Bool,
        commerceExperience: CommerceExperienceType
    ) {
        self.cartEnabled = cartEnabled
        self.commerceExperience = commerceExperience
    }
}
