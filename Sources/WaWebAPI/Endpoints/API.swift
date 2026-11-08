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
    
    let profile: WaWebInstancesItem
    
    init<Profile: WaWebInstancesProtocable>(
        app: Application,
        profile: Profile
    ) {
        self.application = app
        self.profile = WaWebInstancesItem(
            id: profile.id,
            createdAt: profile.createdAt,
            modifiedAt: profile.modifiedAt,
            waWebAccount: profile.waWebAccount,
            instanceId: profile.instanceId,
            relationType: profile.relationType,
            relationId: profile.relationId,
            secret: profile.secret,
            webhook: profile.webhook,
            port: profile.port,
            cc: profile.cc,
            mobile: profile.mobile,
            status: profile.status
        )
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
