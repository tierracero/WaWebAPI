//
//  Client+GetProfilePicUrl.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct GetProfilePicUrlRequests: CrossPlatformContent {
        
        public let contactId: ChatId
        
        public init(
            contactId: ChatId
        ) {
            self.contactId = contactId
        }
    }
    
    /// Returns the contact ID's profile picture URL, if privacy settings allow it
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getProfilePicUrl
    /// - Returns: Promise containing string
    public func getProfilePicUrl(
        contactId: ChatId
    ) throws -> EventLoopFuture<APIResponsePayload<String>>{
        do {
            return try api.post(APIResponsePayload<String>.self, endpoint: .client("getProfilePicUrl"), payload: GetProfilePicUrlRequests(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
