//
//  Client+GetWWebVersion.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {
    
    /// Returns the version of WhatsApp Web currently being run
    /// `POST` https://waweb.tierracero.co/api/v1/client/getWWebVersion
    /// - Returns: Promise containing string
    public func getWWebVersion() throws -> EventLoopFuture<WAResponsePayload<String>>{
        do {
            return try api.post(WAResponsePayload<String>.self, endpoint: .client("getWWebVersion"))
        }
        catch {
            throw error
        }
    }
    
}
