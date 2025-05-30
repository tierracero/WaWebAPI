//
//  Message+GetReactions.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetReactionsRequest: Content {}

extension MessageEndpoint {
    
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
    
}
