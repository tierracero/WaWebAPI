//
//  ClientEndpoint.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

public struct ClientEndpoint {
#if canImport(Vapor)
    let api: API
    
    public init (
        app: Application,
        token: String,
        profile: WaWebInstances
    ) {
        self.api = .init(app: app, token: token, profile: profile)
    }
#endif
}
