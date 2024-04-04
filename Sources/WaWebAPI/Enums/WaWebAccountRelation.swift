//
//  WaWebAccountRelation.swift
//
//
//  Created by Victor Cantu on 3/29/24.
//

import Foundation
#if canImport(Bridges)
import Bridges

public struct CreateWaWebAccountRelation: EnumMigration {
    
    public typealias Enum = WaWebAccountRelation
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(.waweb, .account, .subaccount)
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}
#endif

/// waweb, account, subaccount
public enum WaWebAccountRelation: String, BridgesEnum, CaseIterable {
    
    case waweb
    
    case account
    
    case subaccount
    
    public var description: String {
        switch self {
        case .waweb:
            return "WaWeb"
        case .account:
            return "Cuenta"
        case .subaccount:
            return "Sub Cuenta"
        }
    }
}
