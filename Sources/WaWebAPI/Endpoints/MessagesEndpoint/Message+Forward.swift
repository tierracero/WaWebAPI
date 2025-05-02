//
//  Message+Forward.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.ForwardRequest: @retroactive Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/forward
    /// - Parameter messageId: String
    /// - Returns:
    public func forward(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("forward"), payload: ForwardRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
