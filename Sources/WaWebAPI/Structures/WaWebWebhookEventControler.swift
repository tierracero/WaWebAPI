//
//  WaWebWebhookEventControler.swift
//
//
//  Created by Victor Cantu on 3/29/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Bridges

public struct CreateWaWebWebhookEventControleraWebTokens: TableMigration {
    
    public typealias Table = WaWebWebhookEventControler

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .column("id", .uuid, .primaryKey)
            .column("createdAt", .bigint, .notNull)
            .column("modifiedAt", .bigint, .notNull)
            .column("waWebAccount", .uuid, .notNull)
            .column("instanceId", .text, .notNull)
            .column("eventType", .auto(from: WebhookEvents.self), .notNull)
            .column("eventId", .text, .notNull, .notNull)
            .column("eventSubId", .text, .notNull)
            .column("payload", .text, .notNull)
            .column("status", .text, .notNull)
            .column("deliverd", .bool, .notNull)
            .execute(on: conn)
    }
    
    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

public final class WaWebWebhookEventControler: Table, Schemable {
    
    public static var schemaName = "wawebapi"
    
    @Column("id")
    public var id: UUID
    
    @Column("createdAt")
    public var createdAt: Int64
    
    @Column("modifiedAt")
    public var modifiedAt: Int64
    
    @Column("waWebAccount")
    public var waWebAccount: UUID
    
    @Column("instanceId")
    public var instanceId: String
    
    /// booting loading_screen qr authenticated auth_failure ready disconnected
    /// message, loadingScreen, qr, authenticated, authFailure, ready, disconnected, messageCreate, messageRevokeEveryone, messageRevokeMe, messageAck, messageReaction, mediaUploaded, groupJoin, groupLeave, groupUpdate, changeState, call
    @Column("eventType")
    public var eventType: WebhookEvents
    
    /// in case of a message its the serilized id
    @Column("eventId")
    public var eventId: String
    
    ///  in case of AKC can be 1  2  or 3
    @Column("eventSubId")
    public var eventSubId: String
    
    @Column("payload")
    public var payload: String
    
    @Column("status")
    public var status: String
    
    
    @Column("deliverd")
    public var deliverd: Bool
    
    /// See `Table`
    public init () {}
    
    public init(
        id: UUID = .init(),
        createdAt: Int64 = getNow(),
        modifiedAt: Int64 = getNow(),
        waWebAccount: UUID,
        instanceId: String,
        eventType: WebhookEvents,
        eventId: String,
        eventSubId: String,
        payload: String,
        status: String,
        deliverd: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.waWebAccount = waWebAccount
        self.instanceId = instanceId
        self.eventType = eventType
        self.eventId = eventId
        self.eventSubId = eventSubId
        self.payload = payload
        self.status = status
        self.deliverd = deliverd
    }
    
}
