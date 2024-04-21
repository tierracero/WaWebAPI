//
//  WeWebInstances.swift
//  
//
//  Created by Victor Cantu on 3/29/24.
//

import TCFoundation
import Foundation
#if canImport(Bridges)
import Bridges
#endif
#if canImport(UIKitPlus)
import UIKitPlus
#endif

#if canImport(Bridges)

public struct CreateWaWebInstances: TableMigration {
    public typealias Table = WaWebInstances
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
    
        createBuilder
            .column("id", .uuid, .primaryKey)
            .column("createdAt", .bigint, .notNull)
            .column("modifiedAt", .bigint, .notNull)
            .column("waWebAccount", .uuid, .notNull)
            .column("instanceId", .text, .notNull)
            .column("relationType", .auto(from: WaWebAccountRelation.self), .notNull)
            .column("relationId", .uuid, .notNull)
            .column("secret", .text, .notNull)
            .column("webhook", .text, .notNull)
            .column("cc", .text, .notNull)
            .column("mobile", .text)
            .column("status", .auto(from: BasicStatus.self), .notNull)
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

public final class WaWebInstances: Table, Schemable {
    
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
    
    /// waweb, account, subaccount
    @Column("relationType")
    public var relationType: WaWebAccountRelation
    
    @Column("relationId")
    public var relationId: UUID
    
    /// Webhook Secret to use with HMAC Verfification of webhook data.
    @Column("secret")
    public var secret: String
    
    @Column("webhook")
    public var webhook: String
    
    @Column("cc")
    public var cc: Countries
    
    @Column("mobile")
    public var mobile: String?
    
    /// offline, active, canceled, suspended
    @Column("status")
    public var status: WaWebInstancesStatus
    
    /// See `Table`
    public init () {}
    
    public init(
        id: UUID = .init(),
        createdAt: Int64 = getNow(),
        modifiedAt: Int64 = getNow(),
        waWebAccount: UUID,
        instanceId: String,
        relationType: WaWebAccountRelation,
        relationId: UUID,
        secret: String = callKey(32),
        webhook: String,
        cc: Countries,
        mobile: String?,
        status: WaWebInstancesStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.waWebAccount = waWebAccount
        self.instanceId = instanceId
        self.relationType = relationType
        self.relationId = relationId
        self.secret = secret
        self.webhook = webhook
        self.cc = cc
        self.mobile = mobile
        self.status = status
    }
 
    public init( profile: WhatsAppProfiles) {
        
        guard let waWebAccount = profile.vendorId else {
            fatalError("WhatsAppProfiles Fail to init WhatsAppProfiles.vendorId is null")
        }
        
        guard let instanceToken = profile.instanceToken else {
            fatalError("WhatsAppProfiles Fail to init WhatsAppProfiles.instanceToken is null")
        }
        
        var relationType: WaWebAccountRelation? = .account
        
        self.id = profile.id
        self.createdAt = profile.createdAt
        self.modifiedAt = profile.modifiedAt
        self.waWebAccount = waWebAccount
        self.instanceId = profile.instanceId
        self.relationType = .account
        self.relationId = profile.accountId
        self.secret = instanceToken
        self.webhook = "https://intratc.co/api/webhook/v1/whatsapp/wawebapi/\(profile.instanceId)/\(profile.secureToken)"
        self.cc = .mexico
        self.mobile = profile.mobile
        self.status = .active
    }
    
}

#else

public struct WaWebInstances: Codable {
    
    public var id: UUID
    
    public var createdAt: Int64
    
    public var modifiedAt: Int64
    
    public var waWebAccount: UUID
    
    public var instanceId: String
    
    /// account, subaccount
    public var relationType: WaWebAccountRelation
    
    public var relationId: UUID
    
    /// Webhook Secret
    /// Webhook Secret to use with HMAC Verfification of webhook data.
    public var secret: String
    
    public var webhook: String
    
    public var cc: Countries
    
    public var mobile: String?
    
    /// offline, active, canceled, suspended
    public var status: WaWebInstancesStatus
    
    public init(
        id: UUID,
        createdAt: Int64,
        modifiedAt: Int64,
        waWebAccount: UUID,
        instanceId: String,
        relationType: WaWebAccountRelation,
        relationId: UUID,
        secret: String,
        webhook: String,
        cc: Countries,
        mobile: String?,
        status: WaWebInstancesStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.waWebAccount = waWebAccount
        self.instanceId = instanceId
        self.relationType = relationType
        self.relationId = relationId
        self.secret = secret
        self.webhook = webhook
        self.cc = cc
        self.mobile = mobile
        self.status = status
    }

}

#endif

extension WaWebInstances: Hashable, Equatable {
    
    public static func == (lhs: WaWebInstances, rhs: WaWebInstances) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash (into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#if canImport(UIKitPlus)
extension WaWebInstances: Identable {
    public static var idKey: KeyPath<Self, UUID> { \.id }
}
#endif
