//
//  API.swift
//
//
//  Created by Victor Cantu on 2/29/24.
//

import Foundation
import TCFoundation
import TCFundamentals
import WaWebAPICore
import Vapor

public struct API {

    let application: Application
    
    let WAWEBAPI_TOKEN: String
    
    let profile: WaWebInstances
    
    init (
        app: Application,
        token: String,
        profile: WaWebInstances
    ) {
        self.application = app
        self.WAWEBAPI_TOKEN = token
        self.profile = profile
    }
    
    public var auth: AuthEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    public var call: CallEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    public var chat: ChatEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    public var client: ClientEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    public var contact: ContactEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    public var label: LabelEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    public var message: MessageEndpoint { .init(app: application, token: WAWEBAPI_TOKEN, profile: profile) }
    
    
    

}
