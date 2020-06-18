// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StLibX",
    products: [
        .library(
            name: "StLibX",
            targets: ["StLibX"]),
    ],
    targets: [
        .target(
            name: "StLibX",
            dependencies: []),
        .testTarget(
            name: "StLibXTests",
            dependencies: ["StLibX"]),
    ]
)
