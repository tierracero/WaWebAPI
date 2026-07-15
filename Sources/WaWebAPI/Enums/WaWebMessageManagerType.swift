//
//  WaWebMessageManagerType.swift
//  WaWebAPI
//

import Foundation
import Bridges
import WaWebAPICore

public struct CreateWaWebMessageManagerType: EnumMigration {

    public typealias Enum = WaWebMessageManagerType

    public static func prepare(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        createBuilder
            .add(Enum.allCases)
            .execute(on: conn)
    }

    public static func revert(on conn: any BridgeConnection) -> EventLoopFuture<Void> {
        dropBuilder.execute(on: conn)
    }
}

extension WaWebMessageManagerType: BridgesEnum {

    public typealias RawValue = String

    public static var allCases: [WaWebMessageManagerType] {
        [.text, .media, .location, .poll]
    }

    public init?(rawValue: String) {
        switch rawValue {
        case "text":
            self = .text
        case "media":
            self = .media
        case "location":
            self = .location
        case "poll":
            self = .poll
        default:
            return nil
        }
    }

    public var rawValue: String {
        switch self {
        case .text:
            return "text"
        case .media:
            return "media"
        case .location:
            return "location"
        case .poll:
            return "poll"
        }
    }
}
