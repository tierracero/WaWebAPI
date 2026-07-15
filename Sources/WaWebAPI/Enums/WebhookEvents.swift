//
//  WebhookEvents.swift
//
//
//  Created by Victor Cantu on 4/5/24.
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebWebhookEvents: EnumMigration {
    
    public typealias Enum = WebhookEvents
    
    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(Enum.allCases)
            .execute(on: conn)
    }
    
    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WebhookEvents: BridgesEnum {}
