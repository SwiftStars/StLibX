//
// StdLibX Code (Tests)
// Copyright © Ben Sova 2020 (MIT)
//

import XCTest
@testable import StdLibX

class VersionControllerTests: XCTestCase {

    public func testVersioned() {
        print("\n=--StdLibX Version Controller------------------------------=\n")
        var intController = Versioned<Int>(0)
        XCTAssert(intController.history.isEmpty, false: "History did not start empty.")
        XCTAssert(intController.fullHistory.isEmpty, false: "Full History did not start empty.")
        XCTAssert(intController.variable == 0, false: "Variable did not match starting value. Had: \(intController.variable), Expected: 0.")
        intController.variable = 100
        XCTAssert(
            intController.variable == 100,
            false: "Variable did not match long set value. Had: \(intController.variable), Expected: 100.",
            true: "Variable matched long set value. Proof: \(intController.variable)"
        )
        intController <- 2000
        XCTAssert(
            intController.variable == 2000,
            false: "Variable did not match short set value. Had: \(intController.variable), Expected: 2000.",
            true: "Variable matched short set value. Proof: \(intController.variable)"
        )
        intController.commit("Set variable to 2000")
        XCTAssert(
            intController.history.count == 1,
            false: "History count does not match expected after commit. Had: \(intController.history.count), Expected: 1"
        )
        XCTAssert(
            intController.fullHistory.count == 1,
            false: "Full History count does not match expected after commit. Had: \(intController.fullHistory.count), Expected: 1"
        )
        XCTAssert(
            intController.history[0].message == "Set variable to 2000",
            false: "History commit message does not match expected. Had: \"\(intController.history[0].message)\", Expected: \"Set variable to 2000\"",
            true: "History commit message matched expected."
        )
        XCTAssert(
            intController.history[0].at == 2000,
            false: "History commit variable does not matches expected. Had: \"\(intController.history[0].message)\", Expected: \"Set variable to 2000\"",
            true: "History commit variable matched expected."
        )
        print("\n=----------------------------------------------------------=\n")
    }

    static var allTests = [
        ("Version Controller Tests", testVersioned)
    ]

}
