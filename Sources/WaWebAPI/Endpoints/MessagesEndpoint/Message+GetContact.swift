//
//  Message+GetContact.swift
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
    
    public struct GetContactRequest: CrossPlatformContent {
        
        public let messageId: String
        
        public init(
            messageId: String
        ) {
            self.messageId = messageId
        }
        
    }
    
    
#if canImport(Vapor)
    ///
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/getContact
    /// - Parameter messageId: String
    /// - Returns:
    public func getContact(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("getContact"), payload: GetContactRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
