//
//  File.swift
//  
//
//  Created by Benjamin Sova on 8/4/20.
//

import Foundation

/// Make a struct that works like a basic enum.
///
/// Enumify is designed help to make a simple list of cases
/// that can be used just like a enum but have internal workings
/// like a struct.
///
/// # Pros and Cons vs Enums
/// **Pros**:
/// - Cases can be defined in an extension.
/// - Custom `RawValue`s that are not expressible by a literal or `Equatable` can be used.
///
/// **Cons**:
/// - `switch` statements must always have a `default` case.
/// - Cases must be defined using `static let/func <#name#> = Self(level: Int)`
///   instead of `case <#name#>`
/// - `CaseIterable` must be self written.
/// # Declared in
///  [Enumify.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/Enumify.swift)
///
public protocol Enumify {
    var levelValue: Int { get }
    
    init?(level: Int)
}

public extension Enumify where Self: RawRepresentable, RawValue == Int {
    init?(rawValue: Int) {
        self.init(level: rawValue)
    }
    
    var rawValue: Int { levelValue }
}

public extension Enumify where Self: CaseIterable, AllCases == [Self] {
    init?(level: Int) {
        var returnItem: Self?
        Self.allCases.forEach { (`case`) in
            if `case`.levelValue == level {
                returnItem = `case`
            }
        }
        if let returnItem = returnItem {
            self = returnItem
        } else {
            return nil
        }
    }
}
