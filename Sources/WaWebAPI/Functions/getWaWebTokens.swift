//
//  getWaWebTokens.swift
//
//
//  Created by Victor Cantu on 4/3/24.
//

import Foundation


import Foundation
import Vapor
import SwifQL
import PostgresBridge
import Bridges

/// [ WaWebTokens.token : WaWebTokens ]
fileprivate var waWaWebTokens: [String: WaWebTokens] = [:]

func getWaWebTokens(app: Application, token: String) -> EventLoopFuture<WaWebTokens?> {
 
    if let payload = waWaWebTokens[token] {
        return app.eventLoopGroup.future(payload)
    }
    
    return app.postgres.transaction(to: .psqlEnvironment) { conn in
        
        return SwifQL.select(WaWebTokens.table.*).from(WaWebTokens.table).where(
            \WaWebTokens.$token == token
        ).execute(on: conn).first(decoding: WaWebTokens.self).map { payload in
            
            guard let payload else {
                return nil
            }
     
            waWaWebTokens[token] = payload
            
            return payload
            
        }
    }
}
