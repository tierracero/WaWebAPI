//
//  Client+DeleteProfilePicture.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    /// Deletes the current user's profile picture.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/deleteProfilePicture
    /// - Returns: Promise containing Boolean
    public func deleteProfilePicture() throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("deleteProfilePicture"))
        }
        catch {
            throw error
        }
    }
    
}
#endif
