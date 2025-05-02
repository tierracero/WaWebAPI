//
//  Webhook+Message.swift
//
//
//  Created by Victor Cantu on 3/17/24.
//

import Foundation
import WaWebAPICore

public struct WebhookMessage: Codable {
    
    /// File type `FileMimeType`
    public var media: MessageMedia?
    
    /// This  will be proccessd by `MessageObject.type`
    /// MessageType
    /// chat, image, document, audio, ptt, video, location, callLog, vcard, sticker
    public var message: WaWebAPICore.Message
    
}
