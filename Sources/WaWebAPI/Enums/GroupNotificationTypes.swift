//
//  GroupNotificationTypes.swift
//  
//
//  Created by Victor Cantu on 3/28/24.
//


import Foundation

public enum GroupNotificationTypes: String, Codable {
    
    case add
    case invite
    case remove
    case leave
    case subject
    case description
    case picture
    case announce
    case restrict
    
    public init?(rawValue: String) {
        switch rawValue {
        case "ADD":
            self = .add
        case "add":
            self = .add
        case "INVITE":
            self = .invite
        case "invite":
            self = .invite
        case "REMOVE":
            self = .remove
        case "remove":
            self = .remove
        case "LEAVE":
            self = .leave
        case "leave":
            self = .leave
        case "SUBJECT":
            self = .subject
        case "subject":
            self = .subject
        case "DESCRIPTION":
            self = .description
        case "description":
            self = .description
        case "PICTURE":
            self = .picture
        case "picture":
            self = .picture
        case "ANNOUNCE":
            self = .announce
        case "announce":
            self = .announce
        case "RESTRICT":
            self = .restrict
        case "restrict":
            self = .restrict
        default:
            return nil
        }
        
    }
    
}




