//
//  Message+Star.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension MessageEndpoint {
    
    public struct StarRequest: CrossPlatformContent {
        
        public let messageId: String
        
        public init(
            messageId: String
        ) {
            self.messageId = messageId
        }
        
    }
    
    
#if canImport(Vapor)
    ///
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/star
    /// - Parameter messageId: String
    /// - Returns:
    public func star(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("star"), payload: StarRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}

