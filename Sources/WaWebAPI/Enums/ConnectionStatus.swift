//
//  ConnectionStatus.swift
//
//
//  Created by Victor Cantu on 4/14/24.
//
import Foundation

public enum ConnectionStatus: String, Codable {

    case connected = "CONNECTED"
    
    case pairing = "PAIRING"
    
    case opening = "OPENING"
    
}
