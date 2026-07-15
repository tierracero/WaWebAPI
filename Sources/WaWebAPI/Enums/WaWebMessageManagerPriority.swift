//
//  WaWebMessageManagerPriority.swift
//  WaWebAPI
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebMessageManagerPriority: EnumMigration {

    public typealias Enum = WaWebMessageManagerPriority

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(Enum.allCases)
            .execute(on: conn)
    }

    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WaWebMessageManagerPriority: @retroactive BridgesEnum {}
