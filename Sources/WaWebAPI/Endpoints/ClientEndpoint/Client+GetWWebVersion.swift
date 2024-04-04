//
//  Client+GetWWebVersion.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    /// Returns the version of WhatsApp Web currently being run
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getWWebVersion
    /// - Returns: Promise containing string
    public func getWWebVersion() throws -> EventLoopFuture<APIResponsePayload<String>>{
        do {
            return try api.post(APIResponsePayload<String>.self, endpoint: .client("getWWebVersion"))
        }
        catch {
            throw error
        }
    }
    
}
#endif
