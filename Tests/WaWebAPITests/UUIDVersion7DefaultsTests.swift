import Foundation
import XCTest
@testable import WaWebAPI

final class UUIDVersion7DefaultsTests: XCTestCase {

    func testMessageManagerGeneratesUUIDVersion7ByDefault() {
        let message = WaWebMessageManager(
            createdAt: 1_784_091_600,
            modifiedAt: 1_784_091_600,
            expiresAt: nil,
            sentAt: nil,
            reqId: "request-test",
            instanceId: "instance-test",
            chatId: "5215550000000@c.us",
            mid: "message-test",
            lid: nil,
            wid: nil,
            endpoint: .text,
            payload: "{}",
            file: nil,
            priority: .med,
            status: .queued
        )
        var uuid = message.id.uuid
        let bytes = withUnsafeBytes(of: &uuid) { Array($0) }

        XCTAssertEqual(bytes[6] >> 4, 7)
        XCTAssertEqual(bytes[8] & 0xC0, 0x80)
    }
}
