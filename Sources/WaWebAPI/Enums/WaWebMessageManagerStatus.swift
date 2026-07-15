//
//  WaWebMessageManagerStatus.swift
//  WaWebAPI
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebMessageManagerStatus: EnumMigration {

    public typealias Enum = WaWebMessageManagerStatus

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(Enum.allCases)
            .execute(on: conn)
    }

    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WaWebMessageManagerStatus: @retroactive BridgesEnum {}
