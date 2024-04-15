//
//  Label+GetChats.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

#if canImport(Vapor)
import Vapor
#endif

extension LabelEndpoint {
    
    public struct GetChatsRequst: CrossPlatformContent {
        
        /// EG: a123456789
        public let lableId: String
        
        public init(
            lableId: String
        ) {
            self.lableId = lableId
        }
        
    }
    
#if canImport(Vapor)
    /// Returns array of all Labels assigned to this Chat
    /// `POST` https://intratc.co/node/whatsapp/api/v1/label/getChats
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
#endif
    
}
