import XCTest
@testable import StLibX

public func XCTAssert(_ expression: Bool, false fm: String, true tm: String?) {
    if expression == true {
        if tm != nil {
            print(tm!)
        }
    }
    else {
        XCTFail(fm)
    }
}

final class StLibXTests: XCTestCase {
    func testRepeatUntil() {
        print("\n=--StLibX Repeat Until Test-------------------------------=\n")
        var end = 0
        repeatUntil(run: { (index, _) -> Int in
            if index == 0 {
                print("This code has been run 1 time.")
            }
            else {
                print("This code has been run \(index + 1) times.")
            }
            return index + 1
        }) { (index, out) in
            XCTAssert(index == out,
            false: "The number of times run (\(index)) does not match the output (\(out)).",
            true: nil)
            end = index
            if index >= 10 {
                return true
            }
            return false
        }
        XCTAssert(end == 10,
            false: "repeatUntil(run:check:) was not run all 10 times. It was run \(end) times.",
            true: "repeatUntil(run:check:) was run all 10 times. Proof: \(end)")
        print("\n=----------------------------------------------------------=\n")
    }

    static var allTests = [
        ("testRepeatUntil", testRepeatUntil),
    ]
}
