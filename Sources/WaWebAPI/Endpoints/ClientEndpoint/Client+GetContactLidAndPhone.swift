//
//  Client+GetContactLidAndPhone.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/17/25.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetContactLidAndPhoneRequest: Content {}

extension ClientEndpoint {
    
    /// Get lid and phone number for multiple users
    /// `POST` https://waweb.tierracero.co/api/v1/client/getContactLidAndPhone
    /// - Returns: Promise containing Array of {lid: string, pn: string}
    public func getContactLidAndPhone(
        userIds: [String]
    ) throws -> EventLoopFuture<WAResponsePayload<[LidId]>>{
        do {
            return try api.post(WAResponsePayload<[LidId]>.self, endpoint: .client("getContactLidAndPhone"), payload: GetContactLidAndPhoneRequest(
                userIds: userIds
            ))
        }
        catch {
            throw error
        }
    }
    
}
