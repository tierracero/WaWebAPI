//
//  WeWebInstances.swift
//  
//
//  Created by Victor Cantu on 3/29/24.
//

import TCFoundation
import TCFundamentals
import WaWebAPICore
import Foundation
import Bridges

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

public final class WaWebInstances: WaWebInstancesProtocable, Table, Schemable {
    
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
        
        /* TODO: Analize if
        /// waweb, account, subaccount
        var relationType: WaWebAccountRelation = .account
        
        switch profile.type {
        case .default:
            
        case .tierracero:
            relationType = .waweb
        case .asombrame:
            relationType = .waweb
        case .account:
            relationType = .account
        case .subAccount:
            relationType = .subaccount
        }
        */
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
    
    
    public var item: WaWebInstancesItem {
        return .init(
            id: self.id,
            createdAt: self.createdAt,
            modifiedAt: self.modifiedAt,
            waWebAccount: self.waWebAccount,
            instanceId: self.instanceId,
            relationType: self.relationType,
            relationId: self.relationId,
            secret: self.secret,
            webhook: self.webhook,
            cc: self.cc,
            mobile: self.mobile,
            status: self.status
        )
    }
    
}
