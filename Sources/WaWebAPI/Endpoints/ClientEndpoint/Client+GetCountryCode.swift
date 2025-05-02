//
//  Client+GetCountryCode.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetCountryCodeRequest: @retroactive Content {}

extension ClientEndpoint {
    
    /// Get the country code of a WhatsApp ID.
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getCountryCode
    /// - Returns: Promise containing a string
    public func getCountryCode(
        mobile: String
    ) throws -> EventLoopFuture<APIResponsePayload<GetCountryCodeResponse>>{
        do {
            return try api.post(APIResponsePayload<GetCountryCodeResponse>.self, endpoint: .client("getCountryCode"), payload: GetCountryCodeRequest(
                mobile: mobile
            ))
        }
        catch {
            throw error
        }
    }
    
}
