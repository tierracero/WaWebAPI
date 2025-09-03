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

extension MessageEndpoint.GetMentionsRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getMentions
    /// - Parameter messageId: String
    /// - Returns:
    public func getMentions(
        messageId: String
    ) throws -> EventLoopFuture<WAResponse>{
        do {
            return try api.post( WAResponse.self, endpoint: .chat("getMentions"), payload: GetMentionsRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
