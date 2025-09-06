//
//  Message+Edit.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.EditRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/edit
    /// - Parameter messageId: String
    /// - Returns:
    public func edit(
        messageId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Message>>{
        do {
            return try api.post( WAResponsePayload<Message>.self, endpoint: .chat("edit"), payload: EditRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
