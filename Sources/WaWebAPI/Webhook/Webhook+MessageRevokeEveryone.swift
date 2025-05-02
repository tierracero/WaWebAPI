//
//  Webhook+MessageRevokeEveryone.swift
//
//
//  Created by Victor Cantu on 3/26/24.
//

import Foundation
import WaWebAPICore
import TCFundamentals

public struct WebhookMessageRevokeEveryone: Codable {
    
    public var before: MessageItem
    
    public var after: MessageItem
    
}

