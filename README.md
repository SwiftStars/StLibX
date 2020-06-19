# StdLibX
[![Azure Pipelines Build Status](https://img.shields.io/azure-devops/build/SwiftStars/cf764067-e0bf-47cf-ba14-ac21bb8771d8/1?logo=Azure%20Pipelines&logoColor=informational&style=flat-square)](https://dev.azure.com/SwiftStars/StdLibX/_build?definitionId=1) [![Code Factor Score](https://img.shields.io/codefactor/grade/github/SwiftStars/StdLibX?logo=codefactor&style=flat-square)](https://www.codefactor.io/repository/github/swiftstars/stdlibx) [![Swift Version (v5.2)](https://img.shields.io/badge/Swift-v5.2-orange?style=flat-square&logo=swift)](https://github.com/apple/swift) [![License MIT](https://img.shields.io/github/license/SwiftStars/StLibX?color=blue&logo=GitHub&style=flat-square)](LICENSE)

An extension to the Swift Standard Library.

## Using StdLibX in your project.
To use StdLibX in your project...
1. In the menu bar click `File` -> `Swift Packages` -> `Add Package Dependency.`
2. Paste `https://github.com/SwiftStars/StdLibX` in the search bar and click `Next`.
3. Choose `Branch` and leave it at `master`.
4. Click `Finish`

Or, if you're making a Swift Package, paste the following code into your Package.swift file.
```Swift
.package(url: "https://github.com/SwiftStars/StdLibX.git", .branch("master"))
```
CocoaPods support coming once there is a release.

## Why is it called StdLibX?
I got inspired by [SwiftUIX](https://github.com/SwiftUIX/SwiftUIX), but that one has mostly just SwiftUI stuff, this has Foundation stuff. :smile:
