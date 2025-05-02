//
//  ContactEndpoint.swift
//
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

public final class ContactEndpoint: ContactComponents {
    
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
