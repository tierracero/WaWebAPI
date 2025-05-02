//
//  Chat+SendStateRecording.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ChatEndpoint.SendStateRecordingRequst : @retroactive Content {}
extension ChatEndpoint {
    
    /// Simulate recording audio in chat. This will last for 25 seconds.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/chat/sendStateRecording
    /// - Parameter chatId: WhatsAppChatId
    /// - Returns: Promise containing Boolean
    public func sendStateRecording(
        chatId: WhatsAppChatId
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("sendStateRecording"), payload: SendStateRecordingRequst(
                chatId: chatId
            ))
        }
        catch {
            throw error
        }
    }
    
}
