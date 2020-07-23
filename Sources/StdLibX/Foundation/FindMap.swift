//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import Foundation

extension Sequence {

    /// Find an element with a certain value a certain spot.
    ///
    /// `Sequence.findMap(_:in:)` looks for an element in a Sequence that, when passed into `grabItem(_:)` (aka `in`), matches `find`. If nothing is found `findMap` will return `nil`.
    ///
    /// When the `preferFirst` argument is passed in as `false`, the later element that matches the criteria is used.
    ///
    /// - Parameters:
    ///   - find: The item to compare to the one found in an element.
    ///   - grabItem: A func to convert an element to an item that can be compared to the `find` option.
    ///   - preferFirst: Whether the first element should be used (`true`) or the last one (`false`).
    /// - Returns: The element that contains `find`.
    /// # Declared in
    ///  [FindMap.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/FindMap.swift)
    ///
    public func findMap<T: Equatable>(_ find: T, at grabItem: @escaping (Element) -> T, preferFirst: Bool = true) -> Element? {
        var returnItem: Element?
        forEach { (item) in
            if (returnItem != nil || !preferFirst) && grabItem(item) == find {
                returnItem = item
            }
        }
        return returnItem
    }

    /// Find all elements with a certain value a certain spot.
    ///
    /// `Sequence.findMap(_:in:)` looks for all elements in a Sequence that, when passed into `grabItem(_:)` (aka `in`), matches `find`. If nothing is found `findMap` will return `[]`.
    ///
    /// - Parameters:
    ///   - find: The item to compare to the one found in an element.
    ///   - grabItem: A func to convert an element to an item that can be compared to the `find` option.
    /// - Returns: The elements that contains `find`.
    /// # Declared in
    ///  [FindMap.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/FindMap.swift)
    ///
    public func findMap<T: Equatable>(_ find: T, at grabItem: (Element) -> T) -> [Element] {
        var returnItems: [Element] = []
        forEach { (item) in
            if grabItem(item) == find {
                returnItems.append(item)
            }
        }
        return returnItems
    }

    /// Find an element with a certain value in a certain spot.
    ///
    /// `Sequence.findMap(_:in:)` looks for all elements in a Sequence that, when passed into `grabItem(_:)` (aka `in`), matches `find`. If nothing is found `findMap` will return `false`, otherwise `true`.
    ///
    /// - Parameters:
    ///   - find: The item to compare to the one found in an element.
    ///   - grabItem: A func to convert an element to an item that can be compared to the `find` option.
    /// - Returns: Whether or not any elements contain find
    /// # Declared in
    ///  [FindMap.swift](https://github.com/SwiftStars/StdLibX/tree/master/Sources/StdLibX/Foundation/FindMap.swift)
    ///
    public func findMap<T: Equatable>(_ find: T, at grabItem: (Element) -> T) -> Bool {
        return map(grabItem).contains(find)
    }

}
