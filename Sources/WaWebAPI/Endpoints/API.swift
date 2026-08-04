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
    
    public var auth: AuthEndpoint { .init(api: self) }
    
    public var call: CallEndpoint { .init(api: self) }
    
    public var chat: ChatEndpoint { .init(api: self) }
    
    public var client: ClientEndpoint { .init(api: self) }
    
    public var contact: ContactEndpoint { .init(api: self) }
    
    public var instace: InstanceEndpoint { .init(api: self) }
    
    public var label: LabelEndpoint { .init(api: self) }
    
    public var message: MessageEndpoint { .init(api: self) }
    
    
    

}
