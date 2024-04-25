//
//  Message+Send.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension MessageEndpoint {
    
    public struct SendMessageTextRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public let message: String
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: WhatsAppChatId,
            message: String,
            options: MessageSendOptions?
        ) {
            self.chatId = chatId
            self.message = message
            self.options = options
        }
        
    }
    
    public struct SendMessageMediaRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public let media: MessageMedia?
        
        public let url: String?
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: WhatsAppChatId,
            media: MessageMedia?,
            url: String?,
            options: MessageSendOptions?
        ) {
            self.chatId = chatId
            self.media = media
            self.url = url
            self.options = options
        }
        
    }

    public struct SendMessageLocationRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public let location: Location
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: WhatsAppChatId,
            location: Location,
            options: MessageSendOptions?
        ) {
            self.chatId = chatId
            self.location = location
            self.options = options
        }
        
    }
    
    public struct SendMessagePollRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: WhatsAppChatId
        
        public let poll: Poll
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: WhatsAppChatId,
            poll: Poll,
            options: MessageSendOptions?
        ) {
            self.chatId = chatId
            self.poll = poll
            self.options = options
        }
        
    }
    
    
#if canImport(Vapor)
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/message
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter message: String
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: WhatsAppChatId,
        message: String,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<Message>>{
        
        print("🟢  002")
        
        do {
            return try api.post( APIResponsePayload<Message>.self, endpoint: .message("send/message"), payload: SendMessageTextRequst(
                chatId: chatId,
                message: message,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/media
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter media: MessageMedia
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: WhatsAppChatId,
        media: MessageMedia,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<Message>>{
        do {
            return try api.post( APIResponsePayload<Message>.self, endpoint: .message("send/media"), payload: SendMessageMediaRequst(
                chatId: chatId,
                media: media,
                url: nil,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/media
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter media: MessageMedia
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: WhatsAppChatId,
        mediaUrl: String,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<Message>>{
        do {
            return try api.post( APIResponsePayload<Message>.self, endpoint: .message("send/media"), payload: SendMessageMediaRequst(
                chatId: chatId,
                media: nil,
                url: mediaUrl,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/location
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter location: Location
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: WhatsAppChatId,
        location: Location,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<Message>>{
        do {
            return try api.post( APIResponsePayload<Message>.self, endpoint: .message("send/location"), payload: SendMessageLocationRequst(
                chatId: chatId,
                location: location,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/send/poll
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter poll: Poll
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: WhatsAppChatId,
        poll: Poll,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<Message>>{
        do {
            return try api.post( APIResponsePayload<Message>.self, endpoint: .message("send/poll"), payload: SendMessagePollRequst(
                chatId: chatId,
                poll: poll,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
#endif
}
