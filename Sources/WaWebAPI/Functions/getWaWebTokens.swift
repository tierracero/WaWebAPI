//
//  getWaWebTokens.swift
//
//
//  Created by Victor Cantu on 4/3/24.
//

import Foundation
import WaWebAPICore
import Vapor
import VaporBridges
import SQL
import PostgresBridge
import Bridges

/// [ WaWebTokens.token : WaWebTokens ]
fileprivate final actor TokenControler {

    static let shared = TokenControler()

    var waWaWebTokens: [String: WaWebTokensItem] = [:]
    
    func get(instanceId: String) async -> WaWebTokensItem? {
        return waWaWebTokens[instanceId]
    }
    
    func set(instanceId: String, token: WaWebTokensItem) async {
        waWaWebTokens[instanceId] = token
    }
    
    func get(tokenId: String) async -> WaWebTokensItem? {
        return waWaWebTokens[tokenId]
    }
    
    func set(tokenId: String, token: WaWebTokensItem) async {
        waWaWebTokens[tokenId] = token
    }
    
}

/*
 return conn.eventLoop.makeFutureWithTask {
     await SessionStorage.shared.setCustCommunicationProfile(sitio: sitio, config: nc)
 }
 */
func getWaWebTokens(app: Application, waWebAccount: UUID, instanceId: String) -> EventLoopFuture<WaWebTokensItem?> {
 
    return app.eventLoopGroup.next().makeFutureWithTask { () async throws -> WaWebTokensItem? in
        return await TokenControler.shared.get(instanceId: instanceId)
    }.flatMap { token in
        
        if let token {
            return app.eventLoopGroup.next().makeSucceededFuture(token)
        }
        return app.postgres.transaction(to: .psqlEnvironment) { conn in
            
            let query = SQL.select(WaWebTokens.table.*).from(WaWebTokens.table).where(
                \WaWebTokens.$waWebAccount == waWebAccount &&
                 \WaWebTokens.$instanceId ||> PgArray([instanceId]) => .textArray
            )
            
            return query.execute(on: conn).first(decoding: WaWebTokensItem.self).flatMap { token in
                
                guard let token else {
                    return app.eventLoopGroup.next().makeSucceededFuture(nil)
                }
                
                return app.eventLoopGroup.next().makeFutureWithTask {
                    await TokenControler.shared.set(instanceId: instanceId, token: token)
                }.map {
                    return token
                }
            }
        }
         
    }
}

/// token can be api or auth token
func getWaWebTokens(app: Application, token tokenId: String, instanceId: String?) -> EventLoopFuture<WaWebTokensItem?> {
    
    return app.eventLoopGroup.next().makeFutureWithTask { () async throws -> WaWebTokensItem? in
       return await TokenControler.shared.get(tokenId: tokenId)
    }.flatMap { token in
       
        if let token {
            
            if let instanceId, let tokens = token.instanceId {
                guard tokens.contains(instanceId) else {
                    return app.eventLoopGroup.next().makeSucceededFuture(nil)
                }
            }
            
            return app.eventLoopGroup.next().makeSucceededFuture(token)
            
        }
        
        var query = SQL.select(WaWebTokens.table.*).from(WaWebTokens.table).where(
            \WaWebTokens.$token == tokenId
        )
        
        if let instanceId {
            query = query.and(
                |(
                    \WaWebTokens.$instanceId == nil ||
                     \WaWebTokens.$instanceId ||> PgArray([instanceId]) => .textArray
                )|
            )
        }
        
        return app.postgres.transaction(to: .psqlEnvironment) { conn in
            
            return query.execute(on: conn).first(decoding: WaWebTokensItem.self).flatMap { token in
                
                guard let token else {
                    return app.eventLoopGroup.next().makeSucceededFuture(nil)
                }
                
                return app.eventLoopGroup.next().makeFutureWithTask {
                    await TokenControler.shared.set(instanceId: tokenId, token: token)
                }.map {
                    return token
                }
                
            }
        }
    }
}
