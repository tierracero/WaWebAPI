//
//  Label.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

/// new Label(client, labelData)
public struct Label: Codable{
    
    /// Label hex color
    public let hexColor: String
    
    /// Label ID
    public let id: String
    
    /// Label name
    public let name: String
    
    public init(
        hexColor: String,
        id: String,
        name: String
    ) {
        self.hexColor = hexColor
        self.id = id
        self.name = name
    }
    
}
