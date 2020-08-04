//
//  FindMapTests.swift
//  StdLibXTests
//
//  Created by Benjamin Sova on 7/23/20.
//

import XCTest
@testable import StdLibX

class FindMapTests: XCTestCase {

    func testFindMap() throws {
        print("\n=--Sequence FindMap Tests----------------------------------=\n")
        let simpleTupleSequence = [(one: "String", two: 10), (one: "Int", two: 34), (one: "Float", two: 34), (one: "Double", two: 13), (one: "String", two: 135), (one: "Find Me!", two: 100)]
        print("Simple Tuple Sequence: \(simpleTupleSequence)")
        let findMeTuplesBool = simpleTupleSequence.containsAt("Find Me!", at: \.one)
        XCTAssert(
            findMeTuplesBool,
            false: "Unable to find \"Find Me!\" under \"one\" in \"simpleTupleSequence\" using \"-> Bool\" (Got: \"\(findMeTuplesBool)\")",
            true: "Found \"Find Me!\" under \"one\" in \"simpleTupleSequence\" using \"-> Bool\" (Proof: \"\(findMeTuplesBool)\")"
        )
        let findMeTuplesElements = simpleTupleSequence.findMap("Find Me!", at: \.one)
        XCTAssert(
            findMeTuplesElements[0] == (one: "Find Me!", two: 100) && findMeTuplesElements.count == 1,
            false: "Unable to find \"Find Me!\" under \"one\" in \"simpleTupleSequence\" using \"-> [Element]\" (Got: \"\(findMeTuplesElements)\")",
            true: "Found \"Find Me!\" under \"one\" in \"simpleTupleSequence\" using \"-> [Element]\" (Proof: \"\(findMeTuplesElements)\")"
        )
        let findMeTuplesIndex = simpleTupleSequence.whereAt(13, at: \.two)
        XCTAssert(
            simpleTupleSequence[findMeTuplesIndex ?? XCFail("Unable to find 13 under \"two\" in \"simpleTupleSequence\" using \"-> Int?\" (Got: nil)")] == (one: "Double", two: 13),
            false: "Unable to find 13 under \"two\" in \"simpleTupleSequence\" using \"-> Int?\" (Got: \(String(describing: findMeTuplesIndex)))",
            true: "Found 13 under \"two\" in \"simpleTupleSequence\" using \"-> Int?\" (Proof: \"\(String(describing: findMeTuplesIndex))\")"
        )
        print("\n=----------------------------------------------------------=\n")
    }

    static var allTests = [
        ("Sequence FindMap Tests", testFindMap)
    ]

}

public func XCFail<Type>(_ message: String) -> Type {
    XCTFail(message)
    print("Exiting test since it cannot reasonably continue.")
    print("\n=----------------------------------------------------------=\n")
    exit(1)
}
