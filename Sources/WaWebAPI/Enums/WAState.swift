//
//  WAState.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation

public enum WAState: String, Codable {
    
    case conflict
    
    case connected
    
    case deprecatedVersion
    
    case opening
    
    case pairing
    
    case proxyblock
    
    case SMBTosBlock
    
    case timeout
    
    case TOSBlock
    
    case unlaunched
    
    case unpaired
    
    case unpairedIdle
    
    public init?(rawValue: String) {
        switch rawValue {
        case "CONFLICT":
            self = .conflict
        case "conflict":
            self = .conflict
        case "CONNECTED":
            self = .connected
        case "connected":
            self = .connected
        case "DEPRECATED_VERSION":
            self = .deprecatedVersion
        case "deprecatedVersion":
            self = .deprecatedVersion
        case "OPENING":
            self = .opening
        case "opening":
            self = .opening
        case "PAIRING":
            self = .pairing
        case "pairing":
            self = .pairing
        case "PROXYBLOCK":
            self = .proxyblock
        case "proxyblock":
            self = .proxyblock
        case "SMB_TOS_BLOCK":
            self = .SMBTosBlock
        case "SMBTosBlock":
            self = .SMBTosBlock
        case "TIMEOUT":
            self = .timeout
        case "timeout":
            self = .timeout
        case "TOS_BLOCK":
            self = .TOSBlock
        case "TOSBlock":
            self = .TOSBlock
        case "UNLAUNCHED":
            self = .unlaunched
        case "unlaunched":
            self = .unlaunched
        case "UNPAIRED":
            self = .unpaired
        case "unpaired":
            self = .unpaired
        case "UNPAIRED_IDLE":
            self = .unpairedIdle
        case "unpairedIdle":
            self = .unpairedIdle
        default:
            return nil
        }
        
    }
    
}
