//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

extension Array where Element: CustomStringConvertible {

    /// Make a readable array, using or. (Ex. 10, 12, 85, or 123)
    public func orSplit() -> String {
        var newString = ""
        var index = 0
        self.forEach { (item) in
            if index < count - 1 {
                newString += "\(item), "
                index += 1
            } else {
                newString += "or \(item)"
            }
        }
        return newString
    }

    /// Make a readable array, using and. (Ex. 10, 12, 85, and 123)
    public func andSplit() -> String {
        var newString = ""
        var index = 0
        self.forEach { (item) in
            if index < count - 1 {
                newString += "\(item), "
                index += 1
            } else {
                newString += "and \(item)"
            }
        }
        return newString
    }

    /// Make a readable array, using nor. (Ex. 10, 12, 85, and 123)
    public func norSplit() -> String {
        var newString = ""
        var index = 0
        self.forEach { (item) in
            if index < count - 1 {
                newString += "\(item), "
                index += 1
            } else {
                newString += "nor \(item)"
            }
        }
        return newString
    }
}
