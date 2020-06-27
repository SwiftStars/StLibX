//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

@_exported import Foundation

// MARK: - API

public protocol NilInit {
    init()
}

public extension NilInit {
    static var defaultValueInit: Self {
        return .init()
    }
}
