// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import TCFoundation
#if canImport(PostgresBridge)
import PostgresBridge
#endif
#if canImport(VaporBridges)
import VaporBridges
#endif
#if canImport(Bridges)
import Bridges
#endif
#if canImport(SwifQL)
import SwifQL
#endif
#if canImport(Vapor)
import Vapor
#endif

public struct WaWebAPI {
    
#if canImport(Vapor)
    
    let application: Application
    
    init (_ app: Application) {
        
        application = app
        
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
    
#endif
}

#if canImport(Vapor)

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
