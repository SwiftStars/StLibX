//
// StdLibX Code (Tests)
// Copyright © Ben Sova 2020 (MIT)
//

import XCTest
@testable import StdLibX

class VersionControllerTests: XCTestCase {

    @Versioned var intController = 0
    
    public func testVersioned() {
        print("\n=--StdLibX Version Controller------------------------------=\n")
        XCTAssert($intController.history.isEmpty, false: "History did not start empty.")
        XCTAssert($intController.fullHistory.isEmpty, false: "Full History did not start empty.")
        XCTAssert($intController.wrappedValue == 0, false: "Variable did not match starting value. Had: \(intController), Expected: 0.")
        intController = 100
        XCTAssert(
            intController == 100,
            false: "Variable did not match long set value. Had: \(intController), Expected: 100.",
            true: "Variable matched long set value. Proof: \(intController)"
        )
        $intController <- 2000
        XCTAssert(
            intController == 2000,
            false: "Variable did not match short set value. Had: \(intController), Expected: 2000.",
            true: "Variable matched short set value. Proof: \(intController)"
        )
        $intController.commit("Set variable to 2000")
        XCTAssert(
            $intController.history.count == 1,
            false: "History count does not match expected after commit. Had: \($intController.history.count), Expected: 1"
        )
        XCTAssert(
            $intController.fullHistory.count == 1,
            false: "Full History count does not match expected after commit. Had: \($intController.fullHistory.count), Expected: 1"
        )
        XCTAssert(
            $intController.history[0].message == "Set variable to 2000",
            false: "History commit message does not match expected. Had: \"\($intController.history[0].message)\", Expected: \"Set variable to 2000\"",
            true: "History commit message matched expected."
        )
        XCTAssert(
            $intController.history[0].at == 2000,
            false: "History commit variable does not matches expected. Had: \"\($intController.history[0].message)\", Expected: \"Set variable to 2000\"",
            true: "History commit variable matched expected."
        )
        $intController <- (200, "Removed extra 0")
        XCTAssert(
            $intController.fullHistory.count == 2,
            false: "History count does not match expected after short commit syntax. Had: \($intController.fullHistory.count), Expected: 2"
        )
        XCTAssert(
            $intController.history[1].message == "Removed extra 0",
            false: "History commit after short commit message does not match expected. Had: \"\($intController.history[1].message)\", Expected: \"Removed extra 0\"",
            true: "History commit after short commit message matched expected."
        )
        XCTAssert(
            $intController.history[1].at == 200,
            false: "History commit after short commit variable does not matches expected. Had: \($intController.history[1].at), Expected: 200",
            true: "History commit after short commit variable matched expected."
        )
        print("Adding 3 extra commits.")
        $intController <- (201, "Added 1")
        $intController <- (201000, "Added three amazing zeros")
        $intController <- (270, "Changed to 270")
        let savedHistory = $intController.history
//        print("History: \(intController.history)")
        let latestCommit = $intController.history.last!.id
        do {
            try $intController.reset(.head(1))
        } catch let error as VersionController<Int>.ResetError {
            XCTFail("IntController head reset did not work. Error: \(error)")
            print("Exiting since text cannot reasonably continue.")
            return
        } catch {
            XCTFail("IntController head reset did not work. Error: Unknown")
            print("Exiting since test cannot reasonably continue.")
            return
        }
        XCTAssert(
            $intController.history.count == 4,
            false: "History count after soft head reset does not match expected value. Had: \($intController.history.count), Expected: 4",
            true: "History count after soft head reset matched expected value."
        )
        XCTAssert(
            intController == 270,
            false: "Variable value after soft head reset does not match expected value. Had: \($intController.wrappedValue), Expected: 270"
        )
        XCTAssert(
            $intController.history.last!.at == 201000 && $intController.history.last!.message == "Added three amazing zeros",
            false: "History value or commit message after soft head reset does not match expected value. Had: \($intController.history.last!), Expected: (_, 201000, \"Added three amazing zeros\", _)"
        )
        do {
            try $intController.reset(.origin(1), hard: true)
        } catch {
            if let error = error as? VersionController<Int>.ResetError {
                XCTFail("IntController origin reset did not work. Error: \(error)")
            } else {
                XCTFail("IntController origin reset did not work.")
            }
            print("Exiting since test cannot reasonably continue.")
            return
        }
        XCTAssert(
            $intController.history.count == 2,
            false: "History count after hard origin reset does not match expected value. Had: \($intController.history.count), Expected: 2",
            true: "History count after hard origin reset matched expected value."
        )
        XCTAssert(
            $intController.wrappedValue == 200,
            false: "Variable value after hard origin reset does not match expected value. Had: \($intController.wrappedValue), Expected: 200"
        )
        XCTAssert(
            $intController.history.last!.at == 200 && $intController.history.last!.message == "Removed extra 0",
            false: "History value or commit message after hard origin reset does not match expected value. Had: \($intController.history.last!), Expected: (_, 200, \"Removed extra 0\", _)"
        )
        XCTAssert(
            $intController.fullHistory.allCommits().count == 5,
            false: "Full History all commits count did not match expected value 5. Had: \($intController.fullHistory.allCommits().count)\n\($intController.fullHistory.allCommits())\n\($intController.history)"
        )
        do {
            try $intController.reset(.commit(latestCommit), hard: true)
        } catch {
            if let error = error as? VersionController<Int>.ResetError {
                XCTFail("IntController commit reset did not work. Error: \(error)")
            } else {
                XCTFail("IntController commit reset did not work.")
            }
            print("Exiting since test cannot reasonably continue.")
            return
        }
        XCTAssert(
            $intController.fullHistory.count == 8,
            false: "Full History count did not equal expected value 8 after origin reset. Had: \($intController.fullHistory.count)"
        )
        XCTAssert(
            $intController.history.count == 6,
            false: "History count did not match expected value 6. Had: \($intController.history.count)"
        )
        XCTAssert(
            intController == 270,
            false: "Variable did not match expected value 270 after origin reset. Had: \(intController)"
        )
        
        XCTAssert(
            $intController.history.map({ Commit.init($0) }) == savedHistory.map({ Commit.init($0) }),
            false: """
                History after restoring reset did not match saved history.
                Restored to:
                \($intController.history)

                Saved from:
                \($intController.history)\n
                """,
            true: "History after restoring reset matched saved history."
        )
        print("\n=----------------------------------------------------------=\n")
    }

    static var allTests = [
        ("Version Controller Tests", testVersioned)
    ]

}

struct Commit: Equatable {
    let id: UUID
    let msg: String
    let at: Int
    let time: Date
    
    init(_ commit: VersionController<Int>.Commit) {
        self.id = commit.id
        self.msg = commit.message
        self.at = commit.at
        self.time = commit.time
    }
}
