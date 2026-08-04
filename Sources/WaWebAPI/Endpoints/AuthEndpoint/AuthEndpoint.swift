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

    init(api: API) {
        self.api = api
        super.init()
    }
    
    public init (
        app: Application,
        profile: WaWebInstances
    ) {
        self.api = .init(app: app, profile: profile)
        super.init()
    }
    
}
