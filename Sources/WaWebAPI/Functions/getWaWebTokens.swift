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

/// [ WaWebTokens.token : WaWebTokens ]
fileprivate var waWaWebTokens: [String: WaWebTokens] = [:]

func getWaWebTokens(app: Application, waWebAccount: UUID, instanceId: String) -> EventLoopFuture<WaWebTokens?> {
 
    if let payload = waWaWebTokens[instanceId] {
        return app.eventLoopGroup.future(payload)
    }
    
    return app.postgres.transaction(to: .psqlEnvironment) { conn in
        
        return SwifQL.select(WaWebTokensTable.table.*).from(WaWebTokensTable.table).where(
            \WaWebTokensTable.$waWebAccount == waWebAccount &&
             \WaWebTokensTable.$instanceId ||> PgArray([instanceId]) => .textArray
        ).execute(on: conn).first(decoding: WaWebTokens.self).map { payload in
            
            guard let payload else {
                return nil
            }
     
            waWaWebTokens[instanceId] = payload
            
            return payload
            
        }
    }
}

