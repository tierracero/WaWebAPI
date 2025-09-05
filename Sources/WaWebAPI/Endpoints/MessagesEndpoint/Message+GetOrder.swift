//
//  Message+GetOrder.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetOrderRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getOrder
    /// - Parameter messageId: String
    /// - Returns:
    public func getOrder(
        messageId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Order>>{
        do {
            return try api.post( WAResponsePayload<Order>.self, endpoint: .chat("getOrder"), payload: GetOrderRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
