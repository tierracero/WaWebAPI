//
//  Webhook+MessageEdit.swift
//
//
//  Created by Victor Cantu on 4/26/24.
//

import Foundation
import WaWebAPICore
import TCFundamentals

public struct WebhookMessageEdit: Codable {
    
    /// This  will be proccessd by `MessageObject.type`
    /// MessageType
    /// chat, image, document, audio, ptt, video, location, callLog, vcard, sticker
    public var message: MessageItem
    
    public var newBody: String
    
    public var prevBody: String
    
}
