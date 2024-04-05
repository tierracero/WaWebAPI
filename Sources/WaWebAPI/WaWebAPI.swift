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
        
        //application.postgres.register(.psqlEnvironment)
        
    }
    
    public struct Configuration {
        
        let WAWEBAPI_TOKEN: String?
        
        public init (
            WAWEBAPI_TOKEN: String?
        ) {
            self.WAWEBAPI_TOKEN = WAWEBAPI_TOKEN
        }
        
        public static var environment: Self {
            
            return .init(
                WAWEBAPI_TOKEN: Environment.get("WAAPI_TOKEN")
            )
            
        }
    }
    
    
    public func profile(profile: WaWebInstances) -> API {
        
        guard let token = Environment.get("WAWEBAPI_TOKEN") else {
            print("🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  🔴  ")
            fatalError("[WaWebAPI] WAWEBAPI_TOKEN key not set.")
        }
        
        print("🟢  🟢  🟢  🟢  🟢  🟢  🟢  🟢  🟢  🟢  🟢  🟢  ")
        
        print(token)
        
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

extension WaWebAPI {
    
    struct ConfigurationKey: StorageKey {
        typealias Value = Configuration
    }
    
    public var configuration: Configuration {
        get {
            guard let config = application.storage[ConfigurationKey.self] else {
                fatalError("[WaAPI] Please configure WaAPI in app.swift")
            }
            return config
        }
        nonmutating set {
            application.storage[ConfigurationKey.self] = newValue
        }
    }
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
