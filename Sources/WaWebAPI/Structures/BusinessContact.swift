//
//  BusinessContact.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation

public struct BusinessContact: Codable {
    
    /// ID that represents the contact
    public let id: ContactId
    
    public let businessProfile: BusinessProfile
    
    /// Indicates if you have blocked this contact
    public let isBlocked: Bool
    
    /// Indicates if the contact is a business contact
    public let isBusiness: Bool
    
    /// Indicates if the contact is an enterprise contact
    public let isEnterprise: Bool
    
    /// Indicates if the contact is a group contact
    public let isGroup: Bool
    
    /// Indicates if the contact is the current user's contact
    public let isMe: Bool
    
    /// Indicates if the number is saved in the current phone's contacts
    public let isMyContact: Bool
    
    /// Indicates if the contact is a user contact
    public let isUser: Bool
    
    ///Indicates if the number is registered on WhatsApp
    public let isWAContact: Bool
    
    ///The contact's name, as saved by the current user
    public let name: String?
    
    /// Contact's phone number
    public let number: String
    
    /// The name that the contact has configured to be shown publically
    public let pushname: String
    
    /// A shortened version of name
    public let shortName: String?
    
}
