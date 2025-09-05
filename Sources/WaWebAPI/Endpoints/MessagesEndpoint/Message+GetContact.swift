//
//  Message+GetContact.swift
//
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetContactRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getContact
    /// - Parameter messageId: String
    /// - Returns:
    public func getContact(
        messageId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Contact>>{
        do {
            return try api.post( WAResponsePayload<Contact>.self, endpoint: .chat("getContact"), payload: GetContactRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
