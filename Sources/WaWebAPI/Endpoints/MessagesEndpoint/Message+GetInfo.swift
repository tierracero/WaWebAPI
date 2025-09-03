//
//  Message+GetInfo.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetInfoRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getInfo
    /// - Parameter messageId: String
    /// - Returns:
    public func getInfo(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("getInfo"), payload: GetInfoRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
