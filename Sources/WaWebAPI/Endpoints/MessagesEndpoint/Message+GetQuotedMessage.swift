//
//  Message+GetQuotedMessage.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetQuotedMessageRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getQuotedMessage
    /// - Parameter messageId: String
    /// - Returns:
    public func getQuotedMessage(
        messageId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Message>>{
        do {
            return try api.post( WAResponsePayload<Message>.self, endpoint: .chat("getQuotedMessage"), payload: GetQuotedMessageRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }

}
