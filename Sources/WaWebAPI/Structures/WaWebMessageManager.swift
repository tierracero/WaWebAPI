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
            .column("mid", .text, .notNull)
            .column("lid", .text)
            .column("wid", .text)
            .column("endpoint", .auto(from: WaWebMessageManagerType.self), .notNull)
            .column("payload", .text, .notNull)
            .column("file", .text)
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

    /// req.id HTTP Requste id
    @Column("reqId")
    public var reqId: String

    /// Container / InstanceId
    @Column("instanceId")
    public var instanceId: String

    /// Destination chat, group, or contact.
    /// Example: 5215550000000@c.us
    @Column("chatId")
    public var chatId: String

    /// internal message id
    @Column("mid")
    public var mid: String

    /// 2311231231234@lid
    @Column("lid")
    public var lid: String?

    /// Whatsapp message id Message.id.serilized
    @Column("wid")
    public var wid: String?

    /// text, media, location, poll
    @Column("endpoint")
    public var endpoint: WaWebMessageManagerType

    /// JSON Paylod
    @Column("payload")
    public var payload: String

    /// File to download
    @Column("file")
    public var file: String?

    /// low, med, high
    @Column("priority")
    public var priority: WaWebMessageManagerPriority

    /// queued, sent, failed, cancelled, expired
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
        mid: String,
        lid: String?,
        wid: String?,
        endpoint: WaWebMessageManagerType,
        payload: String,
        file: String?,
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
        self.mid = mid
        self.lid = lid
        self.wid = wid
        self.endpoint = endpoint
        self.payload = payload
        self.file = file
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
            mid: mid,
            lid: lid,
            wid: wid,
            endpoint: endpoint,
            payload: payload,
            file: file,
            priority: priority,
            status: status
        )
    }
}
