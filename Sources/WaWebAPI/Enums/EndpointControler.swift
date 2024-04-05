//
//  EndpointControler.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation

public enum EndpointControler {
    
    case call(String)
    
    case chat(String)
    
    case client(String)
    
    case contact(String)
    
    case groop(String)
    
    case label(String)
    
    case message(String)
    
    case poll(String)
    
    case privateChat(String)
    
    case reaction(String)
    
    public var path: String {
        switch self {
        case .call:
            return "call"
        case .chat:
            return "chat"
        case .client:
            return "client"
        case .contact:
            return "contact"
        case .groop:
            return "groop"
        case .label:
            return "label"
        case .message:
            return "message"
        case .poll:
            return "poll"
        case .privateChat:
            return "privateChat"
        case .reaction:
            return "reaction"
        }
    }
    
}
