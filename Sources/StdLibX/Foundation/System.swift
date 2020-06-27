//
//  System.swift
//  StdLibX
//
//  Created by Benjamin Sova on 6/26/20.
//

import Foundation
import StdLibXFromC

/// Straight from C++, the `system(_:)` command.
///
/// **Note:** `system(_:)` runs commands in `sh` not `zsh`.
///
/// - Parameter cmd: The command to run.
/// - Returns: The exit code of `cmd`.
///
/// # Declared in
///  [System.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/System.swift)
///
@discardableResult
public func system(_ cmd: String) -> Int {
    return Int(shellCMD_I(cmd))
}

/// Straight from C++, the `system(_:)` command.
///
/// **Note:** `system(_:)` runs commands in `sh` not `zsh`.
///
/// - Parameter cmd: The command to run.
///
/// # Declared in
///  [System.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/System.swift)
///
public func systemNoGen(_ cmd: String) {
    shellCMD_V(cmd)
}
