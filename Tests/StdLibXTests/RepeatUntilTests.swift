//
// StdLibX Code (Tests)
// Copyright © Ben Sova 2020 (MIT)
//

import XCTest
@testable import StdLibX

public func XCTAssert(_ expression: Bool, false flsm: String, true trm: String? = nil, fail: Bool = false) {
    if expression != fail {
        if trm != nil {
            print(trm!)
        }
    } else {
        XCTFail(flsm)
    }
}

final class RepeatUntilTests: XCTestCase {
    func testRepeatUntilCheck() {
        print("\n=--StdLibX Repeat Until Check-----------------------------=\n")
        var end = 0
        repeatUntil(run: { (index, _) -> Int in
            if index == 0 {
                print("This code has been run 1 time.")
            } else {
                print("This code has been run \(index + 1) times.")
            }
            return index + 1
        }) { (index, out) in
            XCTAssert(index == out,
            false: "The number of times run (\(index)) does not match the output (\(out)).")
            end = index
            if index >= 10 {
                return true
            }
            return false
        }
        XCTAssert(end == 10,
            false: "repeatUntil(run:check:) was not run all 10 times. It was run \(end) times.",
            true: "repeatUntil(run:check:) was run all 10 times. Proof: \(end)")
        print("\n=---------------------------------------------------------=\n")
    }
    func testRepeatUntilRun() {
        print("\n=--StdLibX Repeat Until Run--------------------------------=\n")
        var end = 0
        var end2 = 0
        repeatUntil { (index, out) -> (Bool, Int) in
            XCTAssert(index == (out ?? 0), false: "The number of times run (\(index)) does not match the output (\(out ?? 0)).", true: "This code has been run \(out ?? 0) \(out != 1 ? "times" : "time").")
            end = out ?? 0
            end2 = index
            return (out == 10, (out ?? 0) + 1)
        }
        XCTAssert(end == 10,
            false: "repeatUntil(run:check:) was not run all 10 times. It was run \(end) or \(end2) times.",
            true: "repeatUntil(run:check:) was run all 10 times. Proof: \(end) and \(end2)")
        print("\n=----------------------------------------------------------=\n")
    }
    static var myTests = [
        ("RepeatUntil Run-Check Test", testRepeatUntilCheck),
        ("RepeatUntil Run Test", testRepeatUntilRun)
    ]
}
