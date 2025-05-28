//
//  Contact+GetChat.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ContactEndpoint.GetChatRequest: Content {}

extension ContactEndpoint {
    
    /// Returns the Chat that corresponds to this Contact. Will return null when getting chat for currently logged in user.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/getChat
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func getChat(
        contactId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("getChat"), payload: GetChatRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
