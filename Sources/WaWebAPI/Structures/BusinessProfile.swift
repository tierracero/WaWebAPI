//
//  BusinessProfile.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation

public struct BusinessProfile: Codable {
    public let automatedType: AutomatedType
    public let dataSource: String
    public let id: ContactId
    public let isProfileLocked: Bool
    public let welcomeMsgProtocolMode: String
    public let address: String?
    public let businessHours: BusinessHours?
    public let categories: [BusinessCategory]?
    public let commands: String?
    public let commandsDescription: String?
    public let coverPhoto: CoverPhoto?
    public let description: String?
    public let email: String?
    public let fbPage: [String]?
    public let igProfessional: [String]?
    public let isProfileLinked: Bool?
    public let latitude: String?
    public let longitude: String?
    public let profileOptions: ProfileOptions?
    public let prompts: String?
    public let tag: String?
    public let website: [String]?

    

}
