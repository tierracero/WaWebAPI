//
//  getWaWebAccounts.swift
//
//
//  Created by Victor Cantu on 4/3/24.
//

import Foundation
import Vapor
import VaporBridges
import SQL
import PostgresBridge
import Bridges
import WaWebAPICore

/// Actor-isolated cache for account snapshots used by this package.
private actor WaWebAccountsCache {
    static let shared = WaWebAccountsCache()

    private var accounts: [UUID: WaWebAccountsItem] = [:]

    func get(_ id: UUID) -> WaWebAccountsItem? {
        accounts[id]
    }

    func set(_ account: WaWebAccountsItem, for id: UUID) {
        accounts[id] = account
    }
}

func getWaWebAccounts(app: Application, id: UUID) -> EventLoopFuture<WaWebAccountsItem?> {
    return app.eventLoopGroup.next().makeFutureWithTask { () async throws -> WaWebAccountsItem? in
        return await WaWebAccountsCache.shared.get(id)
    }.flatMap { cachedAccount in
        if let cachedAccount {
            return app.eventLoopGroup.next().makeSucceededFuture(cachedAccount)
        }

        return app.postgres.transaction(to: .psqlEnvironment) { conn in
            SQL.select(WaWebAccounts.table.*).from(WaWebAccounts.table).where(
                \WaWebAccounts.$id == id
            ).execute(on: conn).first(decoding: WaWebAccountsItem.self)
        }.flatMap { account in
            guard let account else {
                return app.eventLoopGroup.next().makeSucceededFuture(nil)
            }

            return app.eventLoopGroup.next().makeFutureWithTask {
                await WaWebAccountsCache.shared.set(account, for: id)
            }.map { account }
        }
    }
}
