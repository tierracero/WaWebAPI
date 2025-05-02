//
//  Message+Star.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.StarRequest: @retroactive Content {}

extension MessageEndpoint {
    
    /// `POST` https://intratc.co/node/whatsapp/api/v1/message/star
    /// - Parameter messageId: String
    /// - Returns:
    public func star(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("star"), payload: StarRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}

