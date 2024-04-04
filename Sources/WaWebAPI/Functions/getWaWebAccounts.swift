//
//  getWaWebAccounts.swift
//
//
//  Created by Victor Cantu on 4/3/24.
//

import Foundation
import Vapor
import SwifQL
import PostgresBridge
import Bridges

/// [ WaWebAccounts.id : WaWebAccounts ]
fileprivate var waWebAccountsCatch: [UUID: WaWebAccounts] = [:]

func getWaWebAccounts(app: Application, id: UUID) -> EventLoopFuture<WaWebAccounts?> {
 
    if let account = waWebAccountsCatch[id] {
        return app.eventLoopGroup.future(account)
    }
    
    return app.postgres.transaction(to: .psqlEnvironment) { conn in
        
        return SwifQL.select(WaWebAccounts.table.*).from(WaWebAccounts.table).where(
            \WaWebAccounts.$id == id
        ).execute(on: conn).first(decoding: WaWebAccounts.self).map { account in
            
            guard let account else {
                return nil
            }
     
            waWebAccountsCatch[id] = account
            
            return account
            
        }
    }
}
