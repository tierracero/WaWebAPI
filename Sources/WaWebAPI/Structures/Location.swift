//
//  Location.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation

public struct Location: Codable {
    
    /// Bodegua FYS
    public let name: String?
    
    /// Cd. Victoria, Tamaulipas
    public let address: String?
    
    /// Bodegua FYS\nCd. Victoria, Tamaulipas
    public let description: String?
    
    /// https://foursquare.com/v/5033e169e4b011c5488fe07b
    public let url: String?
    
    /// 23.709571838378906
    public let latitude: Double
    
    /// -99.1812973022461
    public let longitude: Double
    
}
