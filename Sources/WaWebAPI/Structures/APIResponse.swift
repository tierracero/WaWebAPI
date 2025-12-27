//
//  WAResponse.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import WaWebAPICore
import Vapor

public struct WAResponse: Content {
    
    public var success: Bool
    
    public var code: ErrorType?
    
    public var message: String?
    
    public init(
        success: Bool = false,
        code: ErrorType? = nil,
        message: String? = nil
    ) {
        self.success = success
        self.code = code
        self.message = message
    }
    
}

public struct WAResponsePayload<T: Sendable>: Content where T : Codable {
    
    public var success: Bool
    
    public var code: ErrorType?
    
    public var message: String?
    
    public var data: T?
    
    public init(
        success: Bool = false,
        code: ErrorType? = nil,
        message: String? = nil,
        data: T? = nil
    ) {
        self.success = success
        self.code = code
        self.message = message
        self.data = data
    }
    
}

