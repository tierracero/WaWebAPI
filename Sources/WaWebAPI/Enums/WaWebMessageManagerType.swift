//
//  WaWebMessageManagerType.swift
//  WaWebAPI
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebMessageManagerType: EnumMigration {

    public typealias Enum = WaWebMessageManagerType

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(Enum.allCases)
            .execute(on: conn)
    }

    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WaWebMessageManagerType: @retroactive BridgesEnum {}
