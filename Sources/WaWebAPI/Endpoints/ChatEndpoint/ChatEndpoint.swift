//
//  ChatEndpoint.swift
//  
//
//  Created by Victor Cantu on 3/30/24.
//

import Foundation
import TCFundamentals
import WaWebAPICore
import TCFoundation
import Vapor

public final class ChatEndpoint: ChatComponents {
    
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
