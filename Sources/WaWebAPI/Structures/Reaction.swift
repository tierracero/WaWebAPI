//
//  Reaction.swift
//
//
//  Created by Victor Cantu on 3/28/24.
//

import Foundation
import TCFoundation

public struct Reaction: Codable {
    
    /// Event id
    public let id: MessageIdentifier
    
    /// Orphan
    public let orphan: Int
    /// Orphan reason (opctional).
    public let orphanReason: String?
    
    public let timestamp: Int64
    
    public let reaction: SocialPostReactionType?
    
    public let read: Bool
    
    /// Parent message id
    public let msgId: MessageIdentifier
    
    /// Sender id
    public let senderId: String
    
    public let ack: Int64
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(MessageIdentifier.self, forKey: .id)
        self.orphan = try container.decode(Int.self, forKey: .orphan)
        self.orphanReason = try container.decodeIfPresent(String.self, forKey: .orphanReason)
        do {
            self.timestamp = try container.decode(Int64.self, forKey: .timestamp)
        }
        catch {
            do {
                self.timestamp = try container.decode(Double.self, forKey: .timestamp).toInt64
            } catch {
                throw error
            }
        }
        self.reaction = try container.decodeIfPresent(SocialPostReactionType.self, forKey: .reaction)
        self.read = try container.decode(Bool.self, forKey: .read)
        self.msgId = try container.decode(MessageIdentifier.self, forKey: .msgId)
        self.senderId = try container.decode(String.self, forKey: .senderId)
        self.ack = try container.decode(Int64.self, forKey: .ack)
    }
    
    
}
