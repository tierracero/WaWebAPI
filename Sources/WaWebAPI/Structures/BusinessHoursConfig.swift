//
//  BusinessHoursConfig.swift
//  
//
//  Created by Victor Cantu on 3/3/24.
//

import Foundation

// MARK: - BusinessHoursConfig
public struct BusinessHoursConfig: Codable {
    
    public let monday: BusinessHoursDay?
    public let tuesday: BusinessHoursDay?
    public let wendsday: BusinessHoursDay?
    public let thursday: BusinessHoursDay?
    public let friday: BusinessHoursDay?
    public let saturday: BusinessHoursDay?
    public let sunday: BusinessHoursDay?

    enum CodingKeys: String, CodingKey {
        
        case monday = "mon"
        case tuesday = "tue"
        case wendsday = "wed"
        case thursday = "thu"
        case friday = "fri"
        case saturday = "sat"
        case sunday = "sun"
        
    }

    public init(
        monday: BusinessHoursDay,
        tuesday: BusinessHoursDay,
        wendsday: BusinessHoursDay,
        thursday: BusinessHoursDay,
        friday: BusinessHoursDay,
        saturday: BusinessHoursDay,
        sunday: BusinessHoursDay
    ) {
        self.monday = monday
        self.tuesday = tuesday
        self.wendsday = wendsday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}
