//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

@_exported import Foundation

// MARK: - API

public protocol EmptyInit {
    init()
}

public extension EmptyInit {
    static var defaultValue: Self {
        return .init()
    }
}
