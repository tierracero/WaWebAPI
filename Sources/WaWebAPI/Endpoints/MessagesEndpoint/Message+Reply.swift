//
//  Message+Reply.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.ReplyRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/reply/message
    /// - Parameter messageId: String
    /// - Returns:
    public func reply(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("reply/message"), payload: ReplyRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
