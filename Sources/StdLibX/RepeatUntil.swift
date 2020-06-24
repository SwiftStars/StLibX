//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

/// Run a void until another void returns true.
///
/// `repeatUntil` runs a void (`run`), over and over again, until a second void (`check`), which is get's ran between each run of `run`, returns `true`.
///
/// `run` is given two variables, an `Int` and a `T?` (`T` is whatever you want it to be).
/// The `Int` is the number of times `run` has been ran before starting at zero. So, the first time will be 0, the second time will be 1, the third time will be 2, and so on.
/// The `T?` is the previous return of `run`. If it is the first time, `T?` will be `nil`.
///
/// `check` is also given two variables, which are the same as `run` is given, an `Int` (the number of times `run` has been run) and `T` (the output of `run`).
///
/// **Note:** The `Int` check is given will be one, not zero, to start since `run` has already been run. That is also why `T?` became just`T`.
///
/// **Tip:** If you don't need to output anything, set `T` to `Void` or `Never`.
///
/// - Parameters:
///   - run: A function with the input of the previous output and the amount of times this has been run, returning a value.
///   - check: A function that is run after `run` that is given the output and amount of times `run` has been run, returning whether or not to continue.
///
/// - Returns: The number of times `run` has been ran and all the `run`s' outputs.
///
/// **Declared in** [RepeatUntil.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/RepeatUntil.swift)
///
@discardableResult
public func repeatUntil<T>(run: @escaping (Int, T?) -> T, check: @escaping (Int, T) -> Bool) -> (index: Int, outputs: [T]) {
    var times = 0
    var prev: T?
    var outs: [T] = []
    while true {
        if prev != nil { outs.append(prev!) }
        prev = run(times, prev)
        times += 1
        if !check(times, prev!) {
            continue
        }
        break
    }
    return (times, outs)
}

/// Run a void until it returns true.
///
/// `repeatUntil` runs a void (`run`), over and over, again until it returns true.
///
/// `run` is given two variables, an `Int` and a `T?` (`T` is whatever you want it to be).
/// The `Int` is the number of times `run` has been ran before starting at zero. So, the first time will be 0, the second time will be 1, the third time will be 2, and so on.
/// The `T?` is the previous return of `run`. If it is the first time, `T?` will be `nil`.
///
/// `run` is expected to return two variables, a `Bool` and a `T`.
/// The `Bool` is whether or not to continue running. `true` will end the function and `false` will continue it.
/// The `T` is an output you would like to pass on to the next run.
///
/// **Tip:** If you don't need to output anything, set `T` to `Void` or `Never`.
///
/// - Parameter run: A function with the input of the number of times it has been run before and the previous output.
///
/// **Declared in** [RepeatUntil.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/RepeatUntil.swift)
///
@discardableResult
public func repeatUntil<T>(run: @escaping (Int, T?) -> (Bool, T)) -> (index: Int, outputs: [T]) {
    var times = 0
    var prev : (continue: Bool, output: T?) = (false, nil)
    var outs: [T] = []
    while true {
        if prev.output != nil { outs.append(prev.output!) }
        prev = run(times, prev.output)
        if !(prev.continue) {
            times += 1
            continue
        }
        break
    }
    return (times, outs)
}
