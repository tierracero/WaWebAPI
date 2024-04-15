//
//  Client+GetChatsByLabelId.swift
//  
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

extension ClientEndpoint {
    
    public struct GetChatsByLabelIdRequest: CrossPlatformContent {
        
        public let labelId: String
        
        public init(
            labelId: String
        ) {
            self.labelId = labelId
        }
        
    }
    
#if canImport(Vapor)
    /// Get all Chats for a specific Label
    /// `POST` https://intratc.co/node/whatsapp/api/v1/client/getChatsByLabelId
    /// - Returns: Promise containing Array of Chat
    public func getChatsByLabelId(
        labelId: String
    ) throws -> EventLoopFuture<APIResponsePayload<[Chat]>>{
        do {
            return try api.post(APIResponsePayload<[Chat]>.self, endpoint: .client("getChatsByLabelId"), payload: GetChatsByLabelIdRequest(
                labelId: labelId
            ))
        }
        catch {
            throw error
        }
    }
#endif
    
}
