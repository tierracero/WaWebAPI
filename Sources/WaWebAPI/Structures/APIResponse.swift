//
//  APIResponse.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import WaWebAPICore
import Vapor

public struct APIResponse: Content {
    
    public let success: Bool
    
    public let code: ErrorType?
    
    public let messsage: String?
    
}

public struct APIResponsePayload<T: Sendable>: Content where T : Codable {
    
    public let success: Bool
    
    public let code: ErrorType?
    
    public let messsage: String?
    
    public let data: T?
    
}
