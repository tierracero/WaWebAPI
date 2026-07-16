import XCTest
import WaWebAPICore
@testable import WaWebAPI

final class WaWebAPITests: XCTestCase {

    func testMessageManagerEnumRawValuesAreStable() {
        XCTAssertEqual(
            WaWebMessageManagerPriority.allCases.map(\.rawValue),
            ["low", "med", "high"]
        )
        XCTAssertEqual(
            WaWebMessageManagerStatus.allCases.map(\.rawValue),
            ["queued", "sent", "failed", "cancelled", "expired"]
        )
        XCTAssertEqual(
            WaWebMessageManagerType.allCases.map(\.rawValue),
            ["text", "media", "location", "poll"]
        )

        XCTAssertEqual(WaWebMessageManagerPriority(rawValue: "med")?.rawValue, "med")
        XCTAssertEqual(WaWebMessageManagerType(rawValue: "poll")?.rawValue, "poll")
        XCTAssertNil(WaWebMessageManagerPriority(rawValue: "urgent"))
        XCTAssertNil(WaWebMessageManagerType(rawValue: "unknown"))
    }

    func testMessageManagerItemProjectionPreservesProtocolFields() {
        let id = UUID(uuidString: "00000000-0000-0000-0000-000000000001")!
        let message = WaWebMessageManager(
            id: id,
            createdAt: 100,
            modifiedAt: 200,
            expiresAt: 300,
            sentAt: nil,
            reqId: "request-test",
            instanceId: "instance-test",
            chatId: "chat-test",
            mid: "message-test",
            lid: "lid-test",
            wid: nil,
            endpoint: .media,
            payload: "{}",
            file: nil,
            priority: .high,
            status: .queued
        )

        let item = message.item

        XCTAssertEqual(item.id, id)
        XCTAssertEqual(item.createdAt, 100)
        XCTAssertEqual(item.modifiedAt, 200)
        XCTAssertEqual(item.expiresAt, 300)
        XCTAssertNil(item.sentAt)
        XCTAssertEqual(item.reqId, "request-test")
        XCTAssertEqual(item.instanceId, "instance-test")
        XCTAssertEqual(item.chatId, "chat-test")
        XCTAssertEqual(item.mid, "message-test")
        XCTAssertEqual(item.lid, "lid-test")
        XCTAssertNil(item.wid)
        XCTAssertEqual(item.endpoint.rawValue, "media")
        XCTAssertEqual(item.payload, "{}")
        XCTAssertNil(item.file)
        XCTAssertEqual(item.priority.rawValue, "high")
        XCTAssertEqual(item.status.rawValue, "queued")
    }
}
