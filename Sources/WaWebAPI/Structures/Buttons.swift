//
//  Buttons.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation

/// new Buttons(body, buttons, title, footer)
public struct Buttons: Codable {
    
    public let body: MessageMedia
    
    public let buttons: ButtonSpec
    
    public let title: String
    
    public let footer: String
    
}
