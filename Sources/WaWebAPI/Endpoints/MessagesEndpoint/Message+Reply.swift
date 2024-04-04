//
//  Message+Reply.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension MessageEndpoint {
    
    public struct ReplyRequest: CrossPlatformContent {
        
        public let messageId: String
        
        public init(
            messageId: String
        ) {
            self.messageId = messageId
        }
        
    }
    
    
    ///
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/reply/text
    /// - Parameter messageId: String
    /// - Returns:
    public func reply(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("reply/text"), payload: ReplyRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
