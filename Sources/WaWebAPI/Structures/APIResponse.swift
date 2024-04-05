//
//  APIResponse.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

public struct APIResponse: Codable {
    
    public let success: Bool
    
    public let code: ErrorType?
    
    public let messsage: String?
    
}

public struct APIResponsePayload<T>: Codable where T : Codable {
    
    public let success: Bool
    
    public let code: ErrorType?
    
    public let messsage: String?
    
    public let data: T?
    
}
