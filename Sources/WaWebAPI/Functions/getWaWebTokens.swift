//
//  getWaWebTokens.swift
//
//
//  Created by Victor Cantu on 4/3/24.
//

import Foundation
import WaWebAPICore
import Vapor
import SwifQL
import PostgresBridge
import Bridges

private var _shared: TokenControler?

/// [ WaWebTokens.token : WaWebTokens ]
fileprivate final actor TokenControler {
    
    public static var shared: TokenControler {
        
        guard let shared = _shared else {
            let shared = TokenControler()
            _shared = shared
            return shared
        }
        return shared
    }
    
    var waWaWebTokens: [String: WaWebTokens] = [:]
    
    func get(instanceId: String) async -> WaWebTokens? {
        return waWaWebTokens[instanceId]
    }
    
    func set(instanceId: String, token: WaWebTokens) async {
        waWaWebTokens[instanceId] = token
    }
    
}

/*
 return conn.eventLoop.makeFutureWithTask {
     await SessionStorage.shared.setCustCommunicationProfile(sitio: sitio, config: nc)
 }
 */
func getWaWebTokens(app: Application, waWebAccount: UUID, instanceId: String) -> EventLoopFuture<WaWebTokens?> {
 
    return app.eventLoopGroup.makeFutureWithTask {
        await TokenControler.shared.get(instanceId: instanceId)
    }.flatMap { token in
        
        if let token {
            return app.eventLoopGroup.future(token)
        }
        return app.postgres.transaction(to: .psqlEnvironment) { conn in
            
            return SwifQL.select(WaWebTokens.table.*).from(WaWebTokens.table).where(
                \WaWebTokens.$waWebAccount == waWebAccount &&
                 \WaWebTokens.$instanceId ||> PgArray([instanceId]) => .textArray
            ).execute(on: conn).first(decoding: WaWebTokens.self).flatMap { token in
                
                guard let token else {
                    return app.eventLoopGroup.future(nil)
                }
                
                return app.eventLoopGroup.makeFutureWithTask {
                    await TokenControler.shared.set(instanceId: instanceId, token: token)
                }.map {
                    return token
                }
            }
        }
         
    }
}

