//
//  Message+GetPayment.swift
//  
//
//  Created by Victor Cantu on 4/2/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

extension MessageEndpoint.GetPaymentRequest: Content {}

extension MessageEndpoint {
    
    /// `POST` https://waweb.tierracero.co/api/v1/message/getPayment
    /// - Parameter messageId: String
    /// - Returns:
    public func getPayment(
        messageId: String
    ) throws -> EventLoopFuture<WAResponsePayload<Payment>>{
        do {
            return try api.post( WAResponsePayload<Payment>.self, endpoint: .chat("getPayment"), payload: GetPaymentRequest(
                messageId: messageId
            ))
        }
        catch {
            throw error
        }
    }
    
}
