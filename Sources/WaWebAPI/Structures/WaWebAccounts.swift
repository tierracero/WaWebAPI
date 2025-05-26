//
//  WaWebAccounts.swift
//
//
//  Created by Victor Cantu on 3/29/24.
//

import TCFoundation
import TCFundamentals
import WaWebAPICore
import Foundation
import Bridges

public struct CreateWaWebAccounts: TableMigration {
    
    public typealias Table = WaWebAccounts
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        
        createBuilder
            .column("id", .uuid, .primaryKey)
            .column("createdAt", .bigint, .notNull)
            .column("modifiedAt", .bigint, .notNull)
            .column("folio", .text, .notNull)
            .column("relationType", .auto(from: WaWebAccountRelation.self), .notNull)
            .column("relationId", .uuid, .notNull)
            .column("firstName", .text, .notNull)
            .column("lastName", .text, .notNull)
            .column("cc", .text, .default(""))
            .column("mobile", .text, .default(""))
            .column("telephone", .text, .default(""))
            .column("email", .text, .default(""))
            .column("street", .text, .default(""))
            .column("colony", .text, .default(""))
            .column("city", .text, .default(""))
            .column("state", .text, .default(""))
            .column("country", .text, .default(""))
            .column("zip", .text, .default(""))
            .column("serviceId", .uuid)
            .column("serviceName", .text, .default(""))
            .column("status", .auto(from: BasicStatus.self), .notNull)
            .execute(on: conn)
        
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

public final class WaWebAccounts: WaWebAccountsProtocable, Table, Schemable {
    
    public static var schemaName = "wawebapi"
    
    @Column("id")
    public var id: UUID
    
    @Column("createdAt")
    public var createdAt: Int64
    
    @Column("modifiedAt")
    public var modifiedAt: Int64
    
    @Column("folio")
    public var folio: String
    
    /// waweb, account, subaccount
    @Column("relationType")
    public var relationType: WaWebAccountRelation
    
    @Column("relationId")
    public var relationId: UUID
    
    @Column("firstName")
    public var firstName: String
    
    @Column("lastName")
    public var lastName: String
    
    @Column("cc")
    public var cc: Countries
    
    @Column("mobile")
    public var mobile: String
    
    @Column("telephone")
    public var telephone: String
    
    @Column("email")
    public var email: String
    
    @Column("street")
    public var street: String
    
    @Column("colony")
    public var colony: String
    
    @Column("city")
    public var city: String
    
    @Column("state")
    public var state: String
    
    @Column("country")
    public var country: Countries
    
    @Column("zip")
    public var zip: String
    
    @Column("serviceId")
    public var serviceId: UUID?
    
    @Column("serviceName")
    public var serviceName: String
    
    /// CustFolioStatus: pending, active, pendingSpare, finalize, archive, collection (string value)
    @Column("status")
    public var status: BasicStatus
    
    /// See `Table`
    public init () {}
    
    public init(
        id: UUID = .init(),
        createdAt: Int64 = getNow(),
        modifiedAt: Int64 = getNow(),
        folio: String = "\(getNow().toString)\(callKey(7))",
        relationType: WaWebAccountRelation,
        relationId: UUID,
        firstName: String,
        lastName: String,
        cc: Countries,
        mobile: String,
        telephone: String,
        email: String,
        street: String,
        colony: String,
        city: String,
        state: String,
        country: Countries,
        zip: String,
        serviceId: UUID?,
        serviceName: String,
        status: BasicStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.folio = folio
        self.relationType = relationType
        self.relationId = relationId
        self.firstName = firstName
        self.lastName = lastName
        self.cc = cc
        self.mobile = mobile
        self.telephone = telephone
        self.email = email
        self.street = street
        self.colony = colony
        self.city = city
        self.state = state
        self.country = country
        self.zip = zip
        self.serviceId = serviceId
        self.serviceName = serviceName
        self.status = status
    }
    
}
