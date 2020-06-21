//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

#if os(OSX) || os(Linux)

/// Prompt the user for information on the command line.
public func prompt(_ message: String) -> String {
    print(message, terminator: "")
    let back = readLine() ?? ""
    return back
}

#endif
