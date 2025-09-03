//
//  AuthEndpoint.swift
//  
//
//  Created by Victor Cantu on 4/1/24.
//

import WaWebAPICore
import TCFoundation
import Vapor

public final class AuthEndpoint: AuthComponents {
    
    var api: API
    
    public init (
        app: Application,
        token: String,
        profile: WaWebInstances
    ) {
        self.api = .init(app: app, token: token, profile: profile)
        super.init()
    }
    
}
