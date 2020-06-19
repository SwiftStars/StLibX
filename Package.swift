// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StdLibX",
    products: [
        .library(
            name: "StdLibX",
            targets: ["StdLibX"]),
    ],
    targets: [
        .target(
            name: "StdLibX",
            dependencies: []),
        .testTarget(
            name: "StdLibXTests",
            dependencies: ["StdLibX"]),
    ]
)
