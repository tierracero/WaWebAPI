//
//  WaWebMessageManagerPriority.swift
//  WaWebAPI
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebMessageManagerPriority: EnumMigration {

    public typealias Enum = WaWebMessageManagerPriority

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(Enum.allCases)
            .execute(on: conn)
    }

    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WaWebMessageManagerPriority: BridgesEnum {

    public typealias RawValue = String

    public static var allCases: [WaWebMessageManagerPriority] {
        [.low, .med, .high]
    }

    public init?(rawValue: String) {
        switch rawValue {
        case "low":
            self = .low
        case "med":
            self = .med
        case "high":
            self = .high
        default:
            return nil
        }
    }

    public var rawValue: String {
        switch self {
        case .low:
            return "low"
        case .med:
            return "med"
        case .high:
            return "high"
        }
    }
}
