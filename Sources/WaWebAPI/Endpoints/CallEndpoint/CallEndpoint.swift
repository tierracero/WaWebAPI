//
//  CallEndpoint.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
#if canImport(Vapor)
import Vapor
#endif

public struct CallEndpoint {
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
