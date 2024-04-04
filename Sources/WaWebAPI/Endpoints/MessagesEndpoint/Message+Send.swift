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

extension MessageEndpoint {
    
    public struct SendMessageTextRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        public let message: String
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: ChatId,
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
        public let chatId: ChatId
        
        public let media: MessageMedia
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: ChatId,
            media: MessageMedia,
            options: MessageSendOptions?
        ) {
            self.chatId = chatId
            self.media = media
            self.options = options
        }
        
    }
    
    public struct SendMessageLocationRequst: CrossPlatformContent {
        
        /// EG: 5218341231234@c.us
        public let chatId: ChatId
        
        public let location: Location
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: ChatId,
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
        public let chatId: ChatId
        
        public let poll: Poll
        
        public let options: MessageSendOptions?
        
        public init(
            chatId: ChatId,
            poll: Poll,
            options: MessageSendOptions?
        ) {
            self.chatId = chatId
            self.poll = poll
            self.options = options
        }
        
    }
    
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/text
    /// - Parameter chatId: ChatId
    /// - Parameter message: String
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: ChatId,
        message: String,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("send/text"), payload: SendMessageTextRequst(
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
    /// - Parameter chatId: ChatId
    /// - Parameter media: MessageMedia
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: ChatId,
        media: MessageMedia,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("send/media"), payload: SendMessageMediaRequst(
                chatId: chatId,
                media: media,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
    
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/location
    /// - Parameter chatId: ChatId
    /// - Parameter location: Location
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: ChatId,
        location: Location,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("send/location"), payload: SendMessageLocationRequst(
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
    /// - Parameter chatId: ChatId
    /// - Parameter poll: Poll
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: ChatId,
        poll: Poll,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("send/poll"), payload: SendMessagePollRequst(
                chatId: chatId,
                poll: poll,
                options: options
            ))
        }
        catch {
            throw error
        }
    }
}
#endif
