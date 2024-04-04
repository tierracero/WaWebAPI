//
//  Call.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//


import Foundation

public struct Call: Codable {
    
    public let canHandleLocally: Bool
    public let from: ChatId
    public let fromMe: Bool
    public let id: String
    public let isGroup: Bool
    public let isVideo: Bool
    public let participants: [ContactId]
    public let timestamp: Int
    public let webClientShouldHandle: Bool

    private enum CodingKeys: String, CodingKey {
        case canHandleLocally
        case from
        case fromMe
        case id
        case isGroup
        case isVideo
        case participants
        case timestamp
        case webClientShouldHandle
    }

    public init(
        canHandleLocally: Bool,
        from: ChatId,
        fromMe: Bool,
        id: String,
        isGroup: Bool,
        isVideo: Bool,
        participants: [ContactId],
        timestamp: Int,
        webClientShouldHandle: Bool
    ) {
        self.canHandleLocally = canHandleLocally
        self.from = from
        self.fromMe = fromMe
        self.id = id
        self.isGroup = isGroup
        self.isVideo = isVideo
        self.participants = participants
        self.timestamp = timestamp
        self.webClientShouldHandle = webClientShouldHandle
    }
}

