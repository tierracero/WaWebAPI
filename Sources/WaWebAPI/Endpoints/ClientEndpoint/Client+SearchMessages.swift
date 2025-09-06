//
//  Client+SearchMessages.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.SearchMessagesRequest: Content {}


extension ClientEndpoint {
    
    /// Searches for messages
    /// `POST` https://waweb.tierracero.co/api/v1/client/searchMessages
    /// - Returns: Promise containing Array of Message
    public func searchMessages(
        query: String,
        option: SearchOptions?
    ) throws -> EventLoopFuture<WAResponsePayload<[Message]>>{
        do {
            return try api.post(WAResponsePayload<[Message]>.self, endpoint: .client("searchMessages"), payload: SearchMessagesRequest(
                query: query,
                option: option
            ))
        }
        catch {
            throw error
        }
    }
    
}
