//
//  MembershipRequestActionResult.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

public struct MembershipRequestActionResult: Codable {
    
    /// User ID whos membership request was approved/rejected
    public let requesterId: String
    
    /// An error code that occurred during the operation for the participant
    public let error: Int
    
    /// A message with a result of membership request action
    public let message: String
    
    public init(
        requesterId: String,
        error: Int,
        message: String
    ) {
        self.requesterId = requesterId
        self.error = error
        self.message = message
    }
}
