//
//  WaWebInstancesStatus.swift
//
//
//  Created by Victor Cantu on 4/20/24.
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebInstancesStatus: EnumMigration {
    
    public typealias Enum = WaWebInstancesStatus
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(.offline, .active, .canceled, .suspended)
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WaWebInstancesStatus: @retroactive BridgesEnum {}
