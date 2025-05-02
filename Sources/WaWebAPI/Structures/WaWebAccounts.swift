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
    
    public typealias Table = WaWebAccountsTable
    
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

public final class WaWebAccountsTable: WaWebAccountsProtocable, Table, Schemable {
    
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
        id: UUID,
        createdAt: Int64,
        modifiedAt: Int64,
        folio: String,
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

extension WaWebAccounts {
    
    public typealias TableRow = WaWebAccountsTable
    
    var table: TableRow {
        
        return .init(
            id: self.id,
            createdAt: self.createdAt,
            modifiedAt: self.modifiedAt,
            folio: self.folio,
            relationType: self.relationType,
            relationId: self.relationId,
            firstName: self.firstName,
            lastName: self.lastName,
            cc: self.cc,
            mobile: self.mobile,
            telephone: self.telephone,
            email: self.email,
            street: self.street,
            colony: self.colony,
            city: self.city,
            state: self.state,
            country: self.country,
            zip: self.zip,
            serviceId: self.serviceId,
            serviceName: self.serviceName,
            status: self.status
        )
        
    }
    
    public static func inSchema(_ sitio: String) -> Schema<TableRow> {
        return TableRow.inSchema(sitio)
    }
    
    public func insert(inSchema schema: String, on conn: BridgeConnection) -> EventLoopFuture<Self>{
        
        let row = self
        
        return self.table.insertNonReturning(inSchema: schema, on: conn).map {
            return row
        }
    }
    
    public func insertNonReturning(inSchema schema: String, on conn: BridgeConnection) -> EventLoopFuture<Void>{
        return self.table.insertNonReturning(inSchema: schema, on: conn)
    }
    
}

extension Array<WaWebAccounts> {
    public func batchInsert(schema: String, on conn: BridgeConnection) -> EventLoopFuture<Void> {
        return self.map{ $0.table }.batchInsert(schema: schema, on: conn)
    }
}

public struct CustSocialMessageQuick: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case deliveredAt
        case readAt
        case senderid
        case ownerid
        case mid
        case type
        case subType
        case message
        case replyTo
        case attachment
        case reactions
        case isDeleted
        case isMine
        case status
    }
    
    
    public var id: UUID
    
    public var createdAt: Int64
    
    public var deliveredAt: Int64?
    
    public var readAt: Int64?
    
    /// Sender Token
    public var senderid: String?
    
    /// Owner Token
    public var ownerid: String
    
    /// Message Token
    public var mid: String
    
    /// msg, msgQry, msgRsp, img, doc, link, voice, vdo
    public var type: MessageType
    
    /// chatBot, autoBot, person, positiveResponse, negativeResponse, button, queryBot
    public var subType: MessageSubType
    
    /// Auth Token provided  by vendor
    public var message: String
    
    /// Auth Token provided  by vendor
    public var replyTo: String?
    
    /// attachment file or url
    public var attachment: String?
    
    public var reactions: [SocialReaction]
    
    public var isDeleted: Bool
    
    public var isMine: Bool
    
    ///new, sent, recived, read
    public var status: MessageStatus
    
    public init(
        id: UUID,
        createdAt: Int64,
        deliveredAt: Int64?,
        readAt: Int64?,
        senderid: String?,
        ownerid: String,
        mid: String,
        type: MessageType,
        subType: MessageSubType,
        message: String,
        replyTo: String?,
        attachment: String?,
        reactions: [SocialReaction],
        isDeleted: Bool,
        isMine: Bool,
        status: MessageStatus
    ) {
        self.id = id
        self.createdAt = createdAt
        self.deliveredAt = deliveredAt
        self.readAt = readAt
        self.senderid = senderid
        self.ownerid = ownerid
        self.mid = mid
        self.type = type
        self.subType = subType
        self.message = message
        self.replyTo = replyTo
        self.attachment = attachment
        self.reactions = reactions
        self.isDeleted = isDeleted
        self.isMine = isMine
        self.status = status
    }
    
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        
        createdAt = try container.decode(Int64.self, forKey: .createdAt)
        
        deliveredAt = try container.decodeIfPresent(Int64.self, forKey: .deliveredAt)
        
        readAt = try container.decodeIfPresent(Int64.self, forKey: .readAt)
        
        senderid = try container.decodeIfPresent(String.self, forKey: .senderid)
        
        ownerid = try container.decode(String.self, forKey: .ownerid)
        
        mid = try container.decode(String.self, forKey: .mid)
        
        type = try container.decode(MessageType.self, forKey: .type)
        
        subType = try container.decode(MessageSubType.self, forKey: .subType)
        
        message = try container.decode(String.self, forKey: .message)
        
        replyTo = try container.decodeIfPresent(String.self, forKey: .replyTo)
        
        attachment = try container.decodeIfPresent(String.self, forKey: .attachment)
        
        do {
            let json = try container.decode(String.self, forKey: .reactions)
            
            if let data = json.data(using: .utf8 ){
                do {
                    reactions = try JSONDecoder().decode( [SocialReaction].self, from: data)
                }
                catch {
                    reactions = []
                }
            }
            else {
                reactions = []
            }
            
        } catch {
            reactions = []
        }
        
        isDeleted = try container.decode(Bool.self, forKey: .isDeleted)
        
        isMine = try container.decode(Bool.self, forKey: .isMine)
        
        status = try container.decode(MessageStatus.self, forKey: .status)
        
    }

}
