//
//  CreateGroupResult.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

/// An object that handles the result for createGroup method
public struct CreateGroupResult: Codable {
    
    /// A group title
    public var title: String
    
    public var gid: ContactId
    
    public init(
        title: String,
        gid: ContactId
    ) {
        self.title = title
        self.gid = gid
    }
    
}
