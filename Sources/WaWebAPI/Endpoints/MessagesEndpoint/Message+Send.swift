//
//  Message+Send.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.SendMessageTextRequest: @retroactive Content {}

extension MessageEndpoint.SendMessageMediaRequest: @retroactive Content {}

extension MessageEndpoint.SendMessageLocationRequest: @retroactive Content {}

extension MessageEndpoint.SendMessagePollRequest: @retroactive Content {}

extension MessageEndpoint {
    
    /// Send a message to this chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/send/message
    /// - Parameter chatId: WhatsAppChatId
    /// - Parameter message: String
    /// - Returns: Promise containing Message that was just sent.
    public func sendMessage(
        chatId: WhatsAppChatId,
        message: String,
        options: MessageSendOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<WaWebAPICore.Message>>{
        
        print("🟢  002")
        
        do {
            return try api.post( APIResponsePayload<WaWebAPICore.Message>.self, endpoint: .message("send/message"), payload: SendMessageTextRequest(
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
    ) throws -> EventLoopFuture<APIResponsePayload<WaWebAPICore.Message>>{
        do {
            return try api.post( APIResponsePayload<WaWebAPICore.Message>.self, endpoint: .message("send/media"), payload: SendMessageMediaRequest(
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
    ) throws -> EventLoopFuture<APIResponsePayload<WaWebAPICore.Message>>{
        do {
            return try api.post( APIResponsePayload<WaWebAPICore.Message>.self, endpoint: .message("send/media"), payload: SendMessageMediaRequest(
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
    ) throws -> EventLoopFuture<APIResponsePayload<WaWebAPICore.Message>>{
        do {
            return try api.post( APIResponsePayload<WaWebAPICore.Message>.self, endpoint: .message("send/location"), payload: SendMessageLocationRequest(
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
    ) throws -> EventLoopFuture<APIResponsePayload<WaWebAPICore.Message>>{
        do {
            return try api.post( APIResponsePayload<WaWebAPICore.Message>.self, endpoint: .message("send/poll"), payload: SendMessagePollRequest(
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
