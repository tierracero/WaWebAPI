//
//  Webhook+MessageRevokeEveryone.swift
//
//
//  Created by Victor Cantu on 3/26/24.
//

import Foundation

public struct WebhookMessageRevokeEveryone: Codable {
    
    public var before: Message
    
    public var after: Message
    
}

