//
//  WebhookEvents.swift
//
//
//  Created by Victor Cantu on 4/5/24.
//

import Foundation
#if canImport(Bridges)
import Bridges

public struct CreateWaWebWebhookEvents: EnumMigration {
    
    public typealias Enum = WebhookEvents
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(
                .message,
                .loadingScreen,
                .qr,
                .authenticated,
                .authFailure,
                .ready,
                .disconnected,
                .groupAdminGhanged,
                .messageCreate,
                .messageRevokeEveryone,
                .messageRevokeMe,
                .messageAck,
                .messageReaction,
                .mediaUploaded,
                .groupJoin,
                .groupLeave,
                .groupMembershipRequest,
                .groupUpdate,
                .changeState,
                .call,
                .incomingCall,
                .messageEdit,
                .voteUpdate,
                .pollCreation,
                .pollUpdate
            )
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}
#endif

/// message, loadingScreen, qr, authenticated, authFailure, ready, disconnected, messageCreate, messageRevokeEveryone, messageRevokeMe, messageAck, messageReaction, mediaUploaded, groupJoin, groupLeave, groupUpdate, changeState, call
public enum WebhookEvents: String, CrossPlatformEnum, CaseIterable {
    
    public static var name = "wawebwebhookevents"
    
    /// Fired when you receive a message. The event contains all data related to the message like content and sender.
    case message
    
    /// Fired when your instance is loading.
    case loadingScreen
    
    /// Fired when a new QR code is generated while your instance is in QR status.
    case qr
    
    /// Fired when the connection is made.
    case authenticated
    
    /// Fired if authentication fails.
    case authFailure
    
    /// Fired as soon as everything is ready.
    case ready
    
    /// Fired when you disconnect your instance.
    case disconnected
    
    /// Emitted when a current user is promoted to an admin or demoted to a regular user.
    case groupAdminGhanged
    
    /// Fired when a new message is created. Applies to both, sent and received messages.
    case messageCreate
    
    /// Fired if a message was deleted for everyone.
    case messageRevokeEveryone
    
    /// Fired if a message was only deleted for you.
    case messageRevokeMe
    
    /// Fired when a message was read or received.
    case messageAck
    
    /// Fired when a reaction is sent, received, updated or removed.
    case messageReaction
    
    /// Fired when a new media file was upload successfully when sending a message.
    case mediaUploaded
    
    /// Fired when someone is added or joined a group chat.
    case groupJoin
    
    /// Fired when someone is removed or left a group chat.
    case groupLeave
    
    // Emitted when some user requested to join the group that has the membership approval mode turned on
    case groupMembershipRequest
    
    /// Fired when the group information is updated.
    case groupUpdate
    
    /// Fired as additional event when your connection status changes.
    case changeState
    
    /// Fired on incoming calls - calls cannot be handled by the API..
    case call
    
    /// Emitted when a call is received
    case incomingCall
    
    case messageEdit
    
    case voteUpdate
    
    case pollCreation
 
    case pollUpdate
    
}
