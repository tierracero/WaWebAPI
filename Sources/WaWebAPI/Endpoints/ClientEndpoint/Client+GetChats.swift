//
//  Client+GetChats.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint {

    /// Get all current chat instances
    /// `POST` https://waweb.tierracero.co/api/v1/client/getChats
    /// - Returns: romise containing Array of Chat
    public func getChats() throws -> EventLoopFuture<WAResponsePayload<[Chat]>>{
        do {
            return try api.post(WAResponsePayload<[Chat]>.self, endpoint: .client("getChats"))
        }
        catch {
            throw error
        }
    }
   
}
