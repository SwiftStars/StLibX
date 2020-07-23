//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
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
@available(iOS, unavailable, message: "System shell commands cannot be run on iOS.")
@available(watchOS, unavailable, message: "System shell commands cannot be run on watchOS.")
@available(tvOS, unavailable, message: "System shell commands cannot be run on tvOS.")
@discardableResult
public func system(_ cmd: String) -> Int {
    return Int(shellCMD_I(cmd))
}

/// Straight from C++, the `system(_:)` command. (Without generating error code.)
///
/// **Note:** `system(_:)` runs commands in `sh` not `zsh`.
///
/// - Parameter cmd: The command to run.
///
/// # Declared in
///  [System.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/System.swift)
///
@available(iOS, unavailable, message: "System shell commands cannot be run on iOS.")
@available(iOSApplicationExtension, unavailable, message: "System shell commands cannot be run on iOS.")
@available(watchOS, unavailable, message: "System shell commands cannot be run on watchOS.")
@available(watchOSApplicationExtension, unavailable, message: "System shell commands cannot be run on watchOS.")
@available(tvOS, unavailable, message: "System shell commands cannot be run on tvOS.")
@available(tvOSApplicationExtension, unavailable, message: "System shell commands cannot be run on iOS.")
public func systemNoGen(_ cmd: String) {
    shellCMD_V(cmd)
}
