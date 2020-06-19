//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

/// Run a void until another void returns true.
/// - Parameters:
///   - run: A function with the input of the previous output and the amount of times this has been run, returning a value.
///   - check: A function that is run after `run` that is given the output and amount of times `run` has been run, returning whether or not to continue.
public func repeatUntil<T>(run: @escaping (Int, T?) -> T, check: @escaping (Int, T) -> Bool) {
    var times = 0
    var prev: T? = nil
    while true {
        prev = run(times, prev)
        times += 1
        if check(times, prev!) {
            return
        }
    }
}
