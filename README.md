# StdLibX
[![Azure Pipelines Build Status](https://img.shields.io/azure-devops/build/SwiftStars/cf764067-e0bf-47cf-ba14-ac21bb8771d8/2?logo=Azure%20Pipelines&logoColor=informational&style=flat-square&labelColor=363C43)](https://dev.azure.com/SwiftStars/StdLibX/_build?definitionId=2) [![Code Factor Score](https://img.shields.io/codefactor/grade/github/SwiftStars/StdLibX?logo=codefactor&style=flat-square&labelColor=363C43)](https://www.codefactor.io/repository/github/swiftstars/stdlibx) [![Swift Version (v5.2)](https://img.shields.io/badge/Swift-v5.2-orange?style=flat-square&logo=swift&labelColor=363C43)](https://github.com/apple/swift) [![License MIT](https://img.shields.io/github/license/SwiftStars/StdLibX?color=blue&logo=GitHub&style=flat-square&labelColor=363C43)](LICENSE)

An extension to the Swift Standard Library.

## What is StdLibX
Swift is great. It can do so much that some people don't even know about. You can use it to make iOS apps, CLIs, and probably a whole bunch more I don't know about. However, there are some things in Swift you can't get that make since to be part of the language (or Apple would never say yes, but we want them anyway).

StdLibX hopes to fix that by providing you with type, functions, and extensions that make Swift easier to use without you rewriting the same old redundant code that you may have been using.

StdLibX has one other goal, too. I'm hoping to keep all things in StdLibX documented and tested, so you can easily understand everything you type.

**Fun Fact:** The "Look Up" feature in MacOS works slightly differently in Xcode. It provides documentation for what you clicked on. Plus, this isn't an Apple Library exclusive thing. Try Look Up on `repeatUntil(run:check:)`.

## Contributing
If you have some spare time (or code), please contribute to StdLibX. The more code included in the library, the more useful it becomes.

 Just fork the project, clone it to your computer and add some features (please also document any new features), then push your changes and open a pull request explaining your changes.

## Using StdLibX in your project.

### For an App with SPM

1. In the menu bar click `File` -> `Swift Packages` -> `Add Package Dependency.`
2. Paste `https://github.com/SwiftStars/StdLibX` in the search bar and click `Next`.
3. Choose `Branch` and leave it at `master`.
4. Click `Finish`

### For an App with CocoaPods

Add `pod 'StdLibX'` to your PodFile.

### For A Swift Package

```swift
.package(url: "https://github.com/SwiftStars/StdLibX.git", from: "0.0.1")
```

```Swift
.package(url: "https://github.com/SwiftStars/StdLibX.git", .branch("main"))
```


## Why is it called StdLibX?
I got inspired by [SwiftUIX](https://github.com/SwiftUIX/SwiftUIX), but that one has mostly just SwiftUI stuff, this has Foundation stuff. :smile:
