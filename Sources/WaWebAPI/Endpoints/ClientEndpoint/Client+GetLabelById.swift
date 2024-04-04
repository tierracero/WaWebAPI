//
//  Cliente+GetLabelById.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor

extension ClientEndpoint {
    
    public struct GetLabelByIdRequests: CrossPlatformContent {
        
        public let labelId: String
        
        public init(
            labelId: String
        ) {
            self.labelId = labelId
        }
    }
    
    /// Returns an object with information about the invite code's group
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getLabelById
    /// - Returns: Promise containing Label
    public func getLabelById(
        labelId: String
    ) throws -> EventLoopFuture<APIResponsePayload<Label>>{
        do {
            return try api.post(APIResponsePayload<Label>.self, endpoint: .client("getLabelById"), payload: GetLabelByIdRequests(
                labelId: labelId
            ))
        }
        catch {
            throw error
        }
    }
    
}
#endif
