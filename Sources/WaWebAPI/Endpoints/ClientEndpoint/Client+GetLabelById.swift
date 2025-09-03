//
//  Cliente+GetLabelById.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension ClientEndpoint.GetLabelByIdRequests: Content {}


extension ClientEndpoint {
    
    /// Returns an object with information about the invite code's group
    /// `POST` https://waweb.tierracero.co/api/v1/client/getLabelById
    /// - Returns: Promise containing Label
    public func getLabelById(
        labelId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Label>>{
        do {
            return try api.post(WAResponsePayload<Label>.self, endpoint: .client("getLabelById"), payload: GetLabelByIdRequests(
                labelId: labelId
            ))
        }
        catch {
            throw error
        }
    }
    
}
