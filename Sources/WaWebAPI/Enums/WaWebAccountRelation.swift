//
//  WaWebAccountRelation.swift
//
//
//  Created by Victor Cantu on 3/29/24.
//

import Foundation
import WaWebAPICore
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

extension WaWebAccountRelation: BridgesEnum {}

