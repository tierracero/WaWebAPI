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
    
    public init (
        app: Application,
        token: String,
        profile: WaWebInstances
    ) {
        self.api = .init(app: app, token: token, profile: profile)
        super.init()
    }
}
