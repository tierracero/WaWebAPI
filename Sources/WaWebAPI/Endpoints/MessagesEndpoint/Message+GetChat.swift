//
//  Message+GetChat.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetChatRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getChat
    /// - Parameter messageId: String
    /// - Returns:
    public func getChat(
        messageId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post( APIResponse.self, endpoint: .chat("getChat"), payload: GetChatRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
