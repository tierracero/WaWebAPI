//
//  Message+Edit.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.EditRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/edit
    /// - Parameter messageId: String
    /// - Returns:
    public func edit(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("edit"), payload: EditRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
