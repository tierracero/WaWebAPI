//
//  BusinessHours.swift
//
//
//  Created by Victor Cantu on 3/3/24.
//

import Foundation

// MARK: - BusinessHours
public struct BusinessHours: Codable {
    public let config: BusinessHoursConfig
    public let timezone: String

    enum CodingKeys: String, CodingKey {
        case config
        case timezone
    }

    public init(
        config: BusinessHoursConfig,
        timezone: String
    ) {
        self.config = config
        self.timezone = timezone
    }
}
