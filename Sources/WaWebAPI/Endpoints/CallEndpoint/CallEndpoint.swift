//
//  CallEndpoint.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import WaWebAPICore
import Vapor

public final class CallEndpoint: CallComponents {
    
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
