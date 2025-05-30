//
//  Contact+GetAbout.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ContactEndpoint.GetAboutRequest: Content {}

extension ContactEndpoint {
    
    /// Gets the Contact's current "about" info. Returns null if you don't have permission to read their status.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/contact/getAbout
    /// - Parameter contactId: String
    /// - Returns: Promise containing Boolean
    public func getAbout(
        contactId: String
    ) throws -> EventLoopFuture<APIResponse>{
        do {
            return try api.post(APIResponse.self, endpoint: .client("getAbout"), payload: GetAboutRequest(
                contactId: contactId
            ))
        }
        catch {
            throw error
        }
    }
    
}
