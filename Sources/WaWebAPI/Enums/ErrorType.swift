//
//  ErrorType.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation

public enum ErrorType: String, Codable {
    
    case generalError
    
    case dbConnError
    
    case invalidPayload
    
    case invalidToken
    
    case expiredToken
    
    case restrictedIp
    
    case restrictedId
    
    case HMACValidationError
    
    case invalidInstance
    
    case expiredInstance
    
    case inactiveInstance
    
    case inactiveAccount
    
    case hotlineAccount
    
    case resorceNotFound
    
    case invalidNumber
    
}
