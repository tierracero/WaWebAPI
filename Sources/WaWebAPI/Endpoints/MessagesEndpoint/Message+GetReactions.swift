//
//  Message+GetReactions.swift
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
    
    public struct GetReactionsRequest: CrossPlatformContent {
        
        public let messageId: String
        
        public init(
            messageId: String
        ) {
            self.messageId = messageId
        }
        
    }
    
    
#if canImport(Vapor)
    ///
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/getReactions
    /// - Parameter messageId: String
    /// - Returns:
    public func getReactions(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("getReactions"), payload: GetReactionsRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
