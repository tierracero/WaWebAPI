//
//  Message+Delete.swift
//
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension MessageEndpoint {
    
    public struct DeleteRequest: CrossPlatformContent {
        
        public let messageId: String
        
        public init(
            messageId: String
        ) {
            self.messageId = messageId
        }
        
    }
    
    ///
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/delete
    /// - Parameter messageId: String
    /// - Returns:
    public func delete(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("delete"), payload: DeleteRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
