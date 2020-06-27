//
// StdLibX Code (Tests)
// Copyright © Ben Sova 2020 (MIT)
//

import XCTest
@testable import StdLibX

class ExitCodeTests: XCTestCase {

    func testExitCodes() throws {
        print("\n=--StdLibX System Exit Codes-------------------------------=\n")
        let exit0 = system("exit 0")
        XCTAssert(exit0 == 0, false: "\"exit 0\" did not return expected exit code 0. It was \(exit0).", true: "\"exit 0\" returned expected exit code 0. Proof: \(exit0)")
        let exit2 = system("exit 2")
        XCTAssert(exit2 == 2, false: "\"exit 2\" did not return expected exit code 2. It was \(exit2).", true: "\"exit 2\" returned expected exit code 2. Proof: \(exit2)")
        print("\n=----------------------------------------------------------=\n")
    }
    
    static var allTests = [
        ("System Exit Code Tests", testExitCodes)
    ]

}
