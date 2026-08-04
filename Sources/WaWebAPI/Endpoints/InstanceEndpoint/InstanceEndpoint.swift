//
//  InstanceEndpoint.swift
//  WaWebAPI
//
//  Created by Victor Cantu on 12/27/25.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

public final class InstanceEndpoint: InstanceComponents {
    
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
