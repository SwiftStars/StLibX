//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

/// Prompt the user for information on the command line.
///
/// - Parameters:
///   - message: The message to prompt the user with.
///   - options: The available options the user can choose. (`nil` allows any option.)
///   - tryAgain: The message to display when the user chooses an unavailable option.
///   - maxTries: The max number of times a user can be presented with the prompt. (`nil` allows infinite tries.)
///   - onLastTry: The message to display when the user hits the last try.
/// - Returns: The response the user gives.
///
/// **Declared in** [Prompt.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/RepeatUntil.swift)
///
@available(iOS, unavailable, message: "System shell input cannot be run on iOS.")
@available(watchOS, unavailable, message: "System shell input cannot be run on watchOS.")
@available(tvOS, unavailable, message: "System shell input cannot be run on tvOS.")
public func prompt(_ message: String, options: [String]? = nil, tryAgain: @escaping (String, [String]) -> String = { (option, options) in "\(option) is not an option. Try \(options.orSplit())" }, maxTries: Int? = nil, onLastTry: String? = nil) -> String {
    var output = ""
    repeatUntil { (index, _) -> (Bool, Never?) in
        if maxTries != nil {
            if index > maxTries! {
                output = onLastTry ?? ""
                return (true, nil)
            }
        }
        print(message, terminator: "")
        let input = readLine() ?? ""
        if options != nil {
            if options!.contains(input) {
                print(tryAgain(input, options!))
                return (false, nil)
            }
        }
        output = input
        return (true, nil)
    }
    return output
}
