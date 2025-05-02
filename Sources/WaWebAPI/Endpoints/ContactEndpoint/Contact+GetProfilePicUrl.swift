//
//  Contact+GetProfilePicUrl.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ContactEndpoint.GetProfilePicUrlRequest: @retroactive Content {}

extension ContactEndpoint {
    
    /// Returns the contact's profile picture URL, if privacy settings allow it
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/getProfilePicUrl
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func getProfilePicUrl(
        contactId: String
    ) throws -> EventLoopFuture<APIResponsePayload<String>>{
        do {
            return try api.post(APIResponsePayload<String>.self, endpoint: .client("getProfilePicUrl"), payload: GetProfilePicUrlRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
