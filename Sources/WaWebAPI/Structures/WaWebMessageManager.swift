//
//  WaWebMessageManager.swift
//  WaWebAPI
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Bridges

public struct CreateWaWebMessageManager: TableMigration {

    public typealias Table = WaWebMessageManager

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .column("id", .uuid, .primaryKey)
            .column("createdAt", .bigint, .notNull)
            .column("modifiedAt", .bigint, .notNull)
            .column("expiresAt", .bigint)
            .column("sentAt", .bigint)
            .column("reqId", .text, .notNull)
            .column("instanceId", .text, .notNull)
            .column("chatId", .text, .notNull)
            .column("endpoint", .auto(from: WaWebMessageManagerType.self), .notNull)
            .column("payload", .text, .notNull)
            .column("file", .text)
            .column("mid", .text, .notNull)
            .column("wid", .text)
            .column("priority", .auto(from: WaWebMessageManagerPriority.self), .notNull)
            .column("status", .auto(from: WaWebMessageManagerStatus.self), .notNull)
            .execute(on: conn)
    }

    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

public final class WaWebMessageManager: WaWebMessageManagerProtocable, Table, Schemable {

    public static var schemaName = "wawebapi"

    @Column("id")
    public var id: UUID

    @Column("createdAt")
    public var createdAt: Int64

    @Column("modifiedAt")
    public var modifiedAt: Int64

    @Column("expiresAt")
    public var expiresAt: Int64?

    @Column("sentAt")
    public var sentAt: Int64?

    @Column("reqId")
    public var reqId: String

    @Column("instanceId")
    public var instanceId: String

    @Column("chatId")
    public var chatId: String

    @Column("endpoint")
    public var endpoint: WaWebMessageManagerType

    @Column("payload")
    public var payload: String

    @Column("file")
    public var file: String?

    @Column("mid")
    public var mid: String

    @Column("wid")
    public var wid: String?

    @Column("priority")
    public var priority: WaWebMessageManagerPriority

    @Column("status")
    public var status: WaWebMessageManagerStatus

    public init() {}

    public init(
        id: UUID = .init(),
        createdAt: Int64 = getNow(),
        modifiedAt: Int64 = getNow(),
        expiresAt: Int64?,
        sentAt: Int64?,
        reqId: String,
        instanceId: String,
        chatId: String,
        endpoint: WaWebMessageManagerType,
        payload: String,
        file: String?,
        mid: String,
        wid: String?,
        priority: WaWebMessageManagerPriority,
        status: WaWebMessageManagerStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.expiresAt = expiresAt
        self.sentAt = sentAt
        self.reqId = reqId
        self.instanceId = instanceId
        self.chatId = chatId
        self.endpoint = endpoint
        self.payload = payload
        self.file = file
        self.mid = mid
        self.wid = wid
        self.priority = priority
        self.status = status
    }

    public var item: WaWebMessageManagerItem {
        .init(
            id: id,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
            expiresAt: expiresAt,
            sentAt: sentAt,
            reqId: reqId,
            instanceId: instanceId,
            chatId: chatId,
            endpoint: endpoint,
            payload: payload,
            file: file,
            mid: mid,
            wid: wid,
            priority: priority,
            status: status
        )
    }
}
