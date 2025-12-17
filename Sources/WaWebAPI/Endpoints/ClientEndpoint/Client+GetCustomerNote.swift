//
//  Client+GetCustomerNote.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/17/25.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetCustomerNoteRequest: Content {}

extension ClientEndpoint {
    
    /// Get a customer note
    /// `POST` https://waweb.tierracero.co/api/v1/client/getCustomerNote
    /// - Returns: Promise containing {chatId: string, content: string, createdAt: number, id: string, modifiedAt: number, type: string}
    public func getCustomerNote(
        userId: String
    ) throws -> EventLoopFuture<WAResponsePayload<CustomerNote>>{
        do {
            return try api.post(WAResponsePayload<CustomerNote>.self, endpoint: .client("getCustomerNote"), payload: GetCustomerNoteRequest(
                userId: userId
            ))
        }
        catch {
            throw error
        }
    }
    
}
