// The Swift Programming Language
// https://docs.swift.org/swift-book

import Vapor
import Foundation
import TCFoundation
import PostgresBridge
import VaporBridges
import Bridges
import SwifQL

public struct WaWebAPI {
    
    let application: Application
    
    init (_ app: Application) {
        
        application = app
        
        application.postgres.register(.psqlEnvironment)
        
    }
    
    public func profile(profile: WaWebInstances) -> API {
        
        guard let token = Environment.get("WAWEBAPI_TOKEN") else {
            fatalError("[WaWebAPI] WAWEBAPI_TOKEN key not set.")
        }
        
        return .init(app: application, token: token, profile: profile)
    }
    
    public func profile(token: String, profile: WaWebInstances) -> API {
        return .init(app: application, token: token, profile: profile)
    }
    
    
}

extension Application {
    public var wawebapi: WaWebAPI { .init(self) }
}

extension Request {
    public var wawebapi: WaWebAPI { .init(application) }
}

#if canImport(Vapor)
protocol CrossPlatformContent: Content {}

#else
protocol CrossPlatformContent: Codable {}
#endif

#if canImport(Bridges)
import Bridges
protocol CrossPlatformEnum: BridgesEnum {}
#else
protocol CrossPlatformEnum: Codable {}
#endif
