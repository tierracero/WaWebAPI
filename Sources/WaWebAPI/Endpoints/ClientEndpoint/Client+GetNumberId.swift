//
//  Client+GetNumberId.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetNumberIdRequests: Content {}


extension ClientEndpoint {
    
    /// Get the registered WhatsApp ID for a number. Will return null if the number is not registered on WhatsApp.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getNumberId
    /// - Returns: Promise containing (Object or null)
    public func getNumberId(
        number: String
    ) throws -> EventLoopFuture<APIResponsePayload<String>>{
        do {
            return try api.post(APIResponsePayload<String>.self, endpoint: .client("getNumberId"), payload: GetNumberIdRequests(
                number: number
            ))
        }
        catch {
            throw error
        }
    }
    
}
