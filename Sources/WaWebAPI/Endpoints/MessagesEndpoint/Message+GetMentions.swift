//
//  Message+GetMentions.swift
//
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetMentionsRequest: @retroactive Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/getMentions
    /// - Parameter messageId: String
    /// - Returns:
    public func getMentions(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("getMentions"), payload: GetMentionsRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
