//
//  MessageEndpoint.swift
//
//
//  Created by Victor Cantu on 4/1/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

public final class MessageEndpoint: MessageComponents {
    
    public var api: API
    
    public init (
        app: Application,
        token: String,
        profile: WaWebInstances
    ) {
        self.api = .init(app: app, token: token, profile: profile)
        super.init()
    }
    
}
