//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

/// Run a void until another void returns true.
///
/// `repeatUntil` runs a void ( `run` ), over and over again, until a second void ( `check` ), which is get's ran between each run of `run`, returns `true`.
///
/// `run` is given two variables, an `Int` and a `T?` (`T` is whatever you want it to be).
/// The `Int` is the number of times `run` has been ran before starting at zero. So, the first time will be 0, the second time will be 1, the third time will be 2, and so on.
/// The `T?` is the previous return of `run`. If it is the first time, `T?` will be `nil`.
///
/// `check` is also given two variables, which are the same as `run` is given, an `Int` (the number of times `run` has been run) and `T` (the output of `run`).
///
/// **Note:** The `Int` check is given will be one, not zero, to start since `run` has already been run. That is also why `T?` became `T`.
///
/// - Parameters:
///   - run: A function with the input of the previous output and the amount of times this has been run, returning a value.
///   - check: A function that is run after `run` that is given the output and amount of times `run` has been run, returning whether or not to continue.
///
/// **Declared in** [RepeatUntil.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/RepeatUntil.swift)
///
public func repeatUntil<T>(run: @escaping (Int, T?) -> T, check: @escaping (Int, T) -> Bool) {
    var times = 0
    var prev: T?
    while true {
        prev = run(times, prev)
        times += 1
        if check(times, prev!) {
            return
        }
    }
}
