//
//  Client+SearchMessages.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct SearchMessagesRequest: CrossPlatformContent {
        
        public let query: String
        
        public let option: SearchOptions?
        
        public init(
            query: String,
            option: SearchOptions?
        ) {
            self.query = query
            self.option = option
        }
    }
    
    /// Searches for messages
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/searchMessages
    /// - Returns: Promise containing Array of Message
    public func searchMessages(
        query: String,
        option: SearchOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<[Message]>>{
        do {
            return try api.post(APIResponsePayload<[Message]>.self, endpoint: .client("searchMessages"), payload: SearchMessagesRequest(
                query: query,
                option: option
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
