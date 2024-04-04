//
//  MessageSendOptions.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation

public struct MessageSendOptions: Codable {
    
    /// Show links preview. Has no effect on multi-device accounts. Defaults to true.
    public let linkPreview: Bool?

     
    /// Send audio as voice message with a generated waveform Defaults to false.
    public let sendAudioAsVoice: Bool?

    /// Send video as gif Defaults to false.
    public let sendVideoAsGif: Bool?

    /// Send media as a sticker Defaults to false.
    public let sendMediaAsSticker: Bool?

    /// Send media as a document Defaults to false.
    public let sendMediaAsDocument: Bool?

    /// Send photo/video as a view once message Defaults to false.
    public let isViewOnce: Bool?

    /// Automatically parse vCards and send them as contacts Defaults to true.
    public let parseVCards: Bool?

    /// Image or video caption
    public let caption: String?

    /// Id of the message that is being quoted (or replied to)
    public let quotedMessageId: String?

    /// Contacts that are being mentioned in the message; Convert to Contact if necesary.
    public let mentions: [WhatsAppChatId]?

    /// Mark the conversation as seen after sending the message Defaults to true.
    public let sendSeen: Bool?

    /// Sets the author of the sticker, (if sendMediaAsSticker is true).
    public let stickerAuthor: String?

    /// Sets the name of the sticker, (if sendMediaAsSticker is true).
    public let stickerName: String?

    /// Sets the categories of the sticker, (if sendMediaAsSticker is true). Provide emoji char array, can be null.
    public let stickerCategories: String?

    /// Media to be sent
    public let media: MessageMedia?

    public init(
        linkPreview: Bool?,
        sendAudioAsVoice: Bool?,
        sendVideoAsGif: Bool?,
        sendMediaAsSticker: Bool?,
        sendMediaAsDocument: Bool?,
        isViewOnce: Bool?,
        parseVCards: Bool?,
        caption: String?,
        quotedMessageId: String?,
        mentions: [WhatsAppChatId]?,
        sendSeen: Bool?,
        stickerAuthor: String?,
        stickerName: String?,
        stickerCategories: String?,
        media: MessageMedia?
    ) {
        self.linkPreview = linkPreview
        self.sendAudioAsVoice = sendAudioAsVoice
        self.sendVideoAsGif = sendVideoAsGif
        self.sendMediaAsSticker = sendMediaAsSticker
        self.sendMediaAsDocument = sendMediaAsDocument
        self.isViewOnce = isViewOnce
        self.parseVCards = parseVCards
        self.caption = caption
        self.quotedMessageId = quotedMessageId
        self.mentions = mentions
        self.sendSeen = sendSeen
        self.stickerAuthor = stickerAuthor
        self.stickerName = stickerName
        self.stickerCategories = stickerCategories
        self.media = media
    }
    
}
