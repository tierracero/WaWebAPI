//
//  Webhook+Acknowledged.swift
//
//
//  Created by Victor Cantu on 3/17/24.
//

import Foundation


public struct WebhookAcknowledged: Codable {
    
    enum CodingKeys: String, CodingKey {
        case acknowledged = "ask"
        case message
    }
    
    public var acknowledged: AcknowledgedType
    
    public var message: Message
    
    
}
