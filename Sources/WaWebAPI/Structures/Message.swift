//
//  Message.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation
import TCFoundation

public struct Message: Codable {
    
    public let ack: Int?
    public let author: String?
    public let body: String?
    public let deviceType: String?
    public let forwardingScore: Int
    public let from: String
    public let fromMe: Bool
    public let groupMentions: [String]
    public let hasMedia: Bool
    public let hasQuotedMsg: Bool
    public let hasReaction: Bool
    public let id: MessageIdentifier
    public let isForwarded: Bool?
    public let isGIF: Bool
    public let isStarred: Bool
    public let isStatus: Bool
    public let links: [Links]
    public let location: Location?
    public let mediaKey: String?
    public let mentionedIds: [ContactId]
    public let timestamp: Int?
    public let to: String?
    /// chat, image, document, audio, ptt, video, location, callLog, vcard, sticker
    public let type: WhatsAppMessageType
    public let vCards: [String]

    private enum CodingKeys: String, CodingKey {
        case ack
        case author
        case body
        case deviceType
        case forwardingScore
        case from
        case fromMe
        case groupMentions
        case hasMedia
        case hasQuotedMsg
        case hasReaction
        case id
        case isForwarded
        case isGIF = "isGif"
        case isStarred
        case isStatus
        case links
        case location
        case mediaKey
        case mentionedIds
        case timestamp
        case to
        case type
        case vCards
    }

}
