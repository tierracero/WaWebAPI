//
//  BusinessHoursDay.swift
//
//
//  Created by Victor Cantu on 3/3/24.
//

import Foundation

// MARK: - BusinessHoursDay
public struct BusinessHoursDay: Codable {
    
    public let hours: [[Int]]?
    
    public let mode: BusinessHoursMode

    enum CodingKeys: String, CodingKey {
        case hours
        case mode
    }

    public init(
        hours: [[Int]]?,
        mode: BusinessHoursMode
    ) {
        self.hours = hours
        self.mode = mode
    }
}
