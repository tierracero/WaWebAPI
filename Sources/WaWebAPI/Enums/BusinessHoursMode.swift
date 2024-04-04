//
//  BusinessHoursMode.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

/// specificHours, open24h, appointmentOnly
public enum BusinessHoursMode: String, Codable {
    
    case specificHours = "specific_hours"
    
    case open24h = "open_24h"
    
    case appointmentOnly = "appointment_only"
    
}
