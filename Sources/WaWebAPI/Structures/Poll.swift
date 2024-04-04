//
//  Poll.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation

/// new Poll(pollName, pollOptions, options)
public struct Poll: Codable {
    
    /// The name of the poll
    public let pollName: String
    
    /// The array of poll options
    public let pollOptions: [PollOptions]
    
    public let options: PollSendOptions
 
    public init(
        pollName: String,
        pollOptions: [PollOptions],
        options: PollSendOptions
    ) {
        self.pollName = pollName
        self.pollOptions = pollOptions
        self.options = options
    }
    
}
