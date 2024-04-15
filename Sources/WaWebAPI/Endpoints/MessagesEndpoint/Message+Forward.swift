//
//  Message+Forward.swift
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
    
    public struct ForwardRequest: CrossPlatformContent {
        
        public let messageId: String
        
        public init(
            messageId: String
        ) {
            self.messageId = messageId
        }
        
    }
    
    
#if canImport(Vapor)
    ///
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/forward
    /// - Parameter messageId: String
    /// - Returns:
    public func forward(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("forward"), payload: ForwardRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
