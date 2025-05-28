//
//  Message+Delete.swift
//
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.DeleteRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/delete
    /// - Parameter messageId: String
    /// - Returns:
    public func delete(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("delete"), payload: DeleteRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
