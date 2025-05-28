//
//  WebhookEvents.swift
//
//
//  Created by Victor Cantu on 4/5/24.
//

import Foundation
import Bridges
import WaWebAPICore

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
                .pollUpdate,
                .contactChanged
            )
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WebhookEvents: BridgesEnum {}
