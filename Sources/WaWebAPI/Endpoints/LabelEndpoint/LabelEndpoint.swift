//
//  LabelEndpoint.swift
//
//
//  Created by Victor Cantu on 3/31/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

public final class LabelEndpoint: LabelComponents {

    var api: API

    init(api: API) {
        self.api = api
        super.init()
    }
    
    public init (
        app: Application,
        token: String,
        profile: WaWebInstances
    ) {
        self.api = .init(app: app, token: token, profile: profile)
        super.init()
    }
}
