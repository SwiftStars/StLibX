// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StdLibX",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v2),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "StdLibX",
            targets: ["StdLibX"])
    ],
    targets: [
        .target(
            name: "StdLibX",
            dependencies: ["StdLibXFromC"]),
        .target(
            name: "StdLibXFromC",
            dependencies: []),
        .testTarget(
            name: "StdLibXTests",
            dependencies: ["StdLibX"])
    ]
)
