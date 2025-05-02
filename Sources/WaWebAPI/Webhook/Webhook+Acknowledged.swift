//
//  Webhook+Acknowledged.swift
//
//
//  Created by Victor Cantu on 3/17/24.
//

import Foundation
import TCFundamentals
import WaWebAPICore

public struct WebhookAcknowledged: Codable {
    
    enum CodingKeys: String, CodingKey {
        case acknowledged = "ack"
        case message
    }
    
    public var acknowledged: AcknowledgedType?
    
    public var message: MessageItem
    
}
