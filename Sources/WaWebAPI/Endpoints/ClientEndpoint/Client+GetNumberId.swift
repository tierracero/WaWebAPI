//
//  Client+GetNumberId.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ClientEndpoint {
    
    public struct GetNumberIdRequests: CrossPlatformContent {
        
        public let number: String
        
        public init(
            number: String
        ) {
            self.number = number
        }
    }
    
#if canImport(Vapor)
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
#endif
    
}
