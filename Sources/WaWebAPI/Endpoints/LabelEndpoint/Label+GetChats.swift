//
//  Label+GetChats.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Vapor
import WaWebAPICore

extension LabelEndpoint.GetChatsRequst: Content {}

extension LabelEndpoint {
    
    /// Returns array of all Labels assigned to this Chat
    /// `POST` https://waweb.tierracero.co/api/v1/label/getChats
    /// - Parameter lableId: a123456789
    /// - Returns: Returns array of all Labels assigned to this Chat
    public func getChats(
        lableId: String
    ) throws -> EventLoopFuture<APIResponsePayload<[Chat]>>{
        do {
            return try api.post( APIResponsePayload<[Chat]>.self, endpoint: .label("getChats"), payload: GetChatsRequst(
                lableId: lableId
            ))
        }
        catch {
            throw error
        }
    }
    
}
