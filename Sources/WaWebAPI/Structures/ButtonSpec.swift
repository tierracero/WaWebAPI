//
//  ButtonSpec.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation

public struct ButtonSpec: Codable {
    
    /// Custom ID to set on the button. A random one will be generated if one is not passed.
    public let id: String?

    /// The text to show on the button.
    public var body: String
    
}
