//
//  Client+SearchMessages.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.SearchMessagesRequest: @retroactive Content {}


extension ClientEndpoint {
    
    /// Searches for messages
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/searchMessages
    /// - Returns: Promise containing Array of Message
    public func searchMessages(
        query: String,
        option: SearchOptions?
    ) throws -> EventLoopFuture<APIResponsePayload<[WaWebAPICore.Message]>>{
        do {
            return try api.post(APIResponsePayload<[WaWebAPICore.Message]>.self, endpoint: .client("searchMessages"), payload: SearchMessagesRequest(
                query: query,
                option: option
            ))
        }
        catch {
            throw error
        }
    }
    
}
