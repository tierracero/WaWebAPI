//
//  Message+Unstar.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.UnstarRequest: Content {}
    
extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/unstar
    /// - Parameter messageId: String
    /// - Returns:
    public func unstar(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("unstar"), payload: UnstarRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
}
