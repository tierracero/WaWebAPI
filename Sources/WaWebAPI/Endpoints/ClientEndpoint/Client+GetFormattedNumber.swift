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

extension ClientEndpoint.GetFormattedNumberRequest: @retroactive Content {}


extension ClientEndpoint {
    
    /// Get the formatted number of a WhatsApp ID.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getFormattedNumber
    /// - Returns: Promise containing a string
    public func getFormattedNumber(
        mobile: String
    ) throws -> EventLoopFuture<APIResponsePayload<GetFormattedNumberResponse>>{
        do {
            return try api.post(APIResponsePayload<GetFormattedNumberResponse>.self, endpoint: .client("getFormattedNumber"), payload: GetFormattedNumberRequest(
                mobile: mobile
            ))
        }
        catch {
            throw error
        }
    }
    
}
