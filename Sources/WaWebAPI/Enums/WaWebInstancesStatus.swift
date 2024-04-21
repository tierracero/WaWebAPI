//
//  WaWebInstancesStatus.swift
//
//
//  Created by Victor Cantu on 4/20/24.
//

import Foundation

#if canImport(Bridges)
import Bridges

public struct CreateWaWebInstancesStatus: EnumMigration {
    
    public typealias Enum = WaWebInstancesStatus
    
    public static func prepare(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(.offline, .active, .canceled, .suspended)
            .execute(on: conn)
    }
    
    public static func revert(on conn: BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}
#endif

/// offline, active, canceled, suspended
public enum WaWebInstancesStatus: String, CrossPlatformEnum, CaseIterable {
    
    case offline
    
    case active
    
    case canceled
    
    case suspended
    
    public var description: String {
        switch self {
        case .offline:
            return "Apagado"
        case .active:
            return "Activo"
        case .canceled:
            return "Cancelada"
        case .suspended:
            return "Suspendida"
        }
    }
    
}
