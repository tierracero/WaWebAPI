//
//  WeWebTokens.swift
//
//
//  Created by Victor Cantu on 3/29/24.
//

import TCFoundation
import TCFundamentals
import WaWebAPICore
import TCFundamentals
import WaWebAPICore
import Foundation
#if canImport(Bridges)
import Bridges

public struct CreateWaWebTokens: TableMigration {
    
    public typealias Table = WaWebTokens
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .column("id", .uuid, .primaryKey)
            .column("createdAt", .bigint, .notNull)
            .column("modifiedAt", .bigint, .notNull)
            .column("expiredAt", .bigint)
            .column("waWebAccount", .uuid, .notNull)
            .column("instanceId", .textArray)
            .column("relationType", .auto(from: WaWebAccountRelation.self), .notNull)
            .column("relationId", .uuid, .notNull)
            .column("secret", .text)
            .column("token", .text, .notNull)
            .column("ip", .textArray)
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

public final class WaWebTokens: WaWebTokensProtocable, Table, Schemable {
    
    public static var schemaName = "wawebapi"
    
    @Column("id")
    public var id: UUID
    
    @Column("createdAt")
    public var createdAt: Int64
    
    @Column("modifiedAt")
    public var modifiedAt: Int64
    
    @Column("expiredAt")
    public var expiredAt: Int64?
    
    @Column("waWebAccount")
    public var waWebAccount: UUID
    
    @Column("instanceId")
    public var instanceId: [String]?
    
    /// account, subaccount
    @Column("relationType")
    public var relationType: WaWebAccountRelation
    
    @Column("relationId")
    public var relationId: UUID
    
    /// Webhook Secret
    /// Webhook Secret to use with HMAC Verfification of webhook data.
    @Column("secret")
    public var secret: String?
    
    @Column("token")
    public var token: String
    
    @Column("ip")
    public var ip: [String]?
    
    /// See `Table`
    public init () {}
    
    public init(
        id: UUID,
        createdAt: Int64,
        modifiedAt: Int64,
        expiredAt: Int64?,
        waWebAccount: UUID,
        instanceId: [String]?,
        relationType: WaWebAccountRelation,
        relationId: UUID,
        secret: String?,
        token: String,
        ip: [String]?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.expiredAt = expiredAt
        self.waWebAccount = waWebAccount
        self.instanceId = instanceId
        self.relationType = relationType
        self.relationId = relationId
        self.secret = secret
        self.token = token
        self.ip = ip
    }
    
    
}

#endif
