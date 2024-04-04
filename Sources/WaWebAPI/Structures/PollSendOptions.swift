//
//  PollSendOptions.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation

public struct PollSendOptions: Codable {
    
    /// If false it is a single choice poll, otherwise it is a multiple choice poll (false by default)
    /// Defaults to false.
    public let allowMultipleAnswers: Bool
    
    /// The custom message secret, can be used as a poll ID. NOTE: it has to be a unique vector with a length of 32
    public let messageSecret: [Int]?
    
    public init(
        allowMultipleAnswers: Bool,
        messageSecret: [Int]?
    ) {
        self.allowMultipleAnswers = allowMultipleAnswers
        self.messageSecret = messageSecret
    }
    
}
