//
//  Message+Reload.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.ReloadRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/reload
    /// - Parameter messageId: String
    /// - Returns:
    public func reload(
        messageId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Message>>{
        do {
            return try api.post( WAResponsePayload<Message>.self, endpoint: .chat("reload"), payload: ReloadRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
