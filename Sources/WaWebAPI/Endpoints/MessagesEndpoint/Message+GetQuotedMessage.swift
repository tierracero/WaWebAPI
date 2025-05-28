//
//  Message+GetQuotedMessage.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetQuotedMessageRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/getQuotedMessage
    /// - Parameter messageId: String
    /// - Returns:
    public func getQuotedMessage(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("getQuotedMessage"), payload: GetQuotedMessageRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }

}
