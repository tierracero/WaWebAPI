//
//  ClientEndpoint.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import TCFoundation
import Vapor

public final class ClientEndpoint: ClientComponents {
    
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
