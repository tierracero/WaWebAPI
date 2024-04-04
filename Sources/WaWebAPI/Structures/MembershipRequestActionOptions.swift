//
//  MembershipRequestActionOptions.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

public struct MembershipRequestActionOptions: Codable {
    /// User ID/s who requested to join the group, if no value is provided, the method will search for all membership requests for that group
    public let requesterIds: [String]
    
    /// The number of milliseconds to wait before performing an operation for the next requester. If it is an array, a random sleep time between the sleep[0] and sleep[1] values will be added (the difference must be >=100 ms, otherwise, a random sleep time between sleep[1] and sleep[1] + 100 will be added). If sleep is a number, a sleep time equal to its value will be added. By default, sleep is an array with a value of [250, 500]
    public let sleep: [Int]
    
    public init(
        requesterIds: [String],
        sleep: [Int]
    ) {
        self.requesterIds = requesterIds
        self.sleep = sleep
    }
    
}
