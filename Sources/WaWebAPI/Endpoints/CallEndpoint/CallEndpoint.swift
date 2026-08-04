//
//  CallEndpoint.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import WaWebAPICore
import TCFoundation
import Vapor

public final class CallEndpoint: CallComponents {
    
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
