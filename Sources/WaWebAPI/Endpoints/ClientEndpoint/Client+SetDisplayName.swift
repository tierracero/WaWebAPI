//
//  Client+SetDisplayName.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.SetDisplayNameRequest: Content {}


extension ClientEndpoint {
    
    /// Sets the current user's display name. This is the name shown to WhatsApp users that have not added you as a contact beside your number in groups and in your profile.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/setDisplayName
    /// - Returns: Promise containing boolean
    public func setDisplayName(
        displayName: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("setDisplayName"), payload: SetDisplayNameRequest(
                displayName: displayName
            ))
        }
        catch {
            throw error
        }
    }
    
}
