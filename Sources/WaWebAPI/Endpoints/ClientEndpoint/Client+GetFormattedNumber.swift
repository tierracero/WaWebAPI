//
//  Client+GetFormattedNumber.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetFormattedNumberRequest: Content {}


extension ClientEndpoint {
    
    /// Get the formatted number of a WhatsApp ID.
    /// `POST` https://waweb.tierracero.co/api/v1/client/getFormattedNumber
    /// - Returns: Promise containing a string
    public func getFormattedNumber(
        mobile: String
    ) throws -> EventLoopFuture<WAResponsePayload<GetFormattedNumberResponse>>{
        do {
            return try api.post(WAResponsePayload<GetFormattedNumberResponse>.self, endpoint: .client("getFormattedNumber"), payload: GetFormattedNumberRequest(
                mobile: mobile
            ))
        }
        catch {
            throw error
        }
    }
    
}
