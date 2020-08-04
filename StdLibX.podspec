Pod::Spec.new do |spec|

  spec.name         = "StdLibX"
  spec.version      = "0.0.2"
  spec.summary      = "An extension to the Swift Standard Library."

  spec.description  = <<-DESC
StdLibX extends the basic functionalities of the Swift Standard Library, giving it powerful, short, easy to understand functions, varibles, and types.

repeatUntil is an alternitive to the while true break loop, that passes a return output between each action and allows you to get each output at the end.

prompt allows you to prompt the user for input on the command line with built in handling if the user an unavaible option.

findMap finds all elements in an Array that contain a certain value at a certain spot.

Along with those, theres more stuff like the removed system function, converting from Arrays to a String using readable methods, and more.

StdLibX also brings new power to SwiftUI, like more colors that fit your specifc theme.
                   DESC

  spec.homepage     = "https://github.com/SwiftStars/StdLibX"

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Ben Sova" => "65474198+BenSova@users.noreply.github.com" }

  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.swift_versions = "5.2"

  spec.source       = { :git => "https://github.com/SwiftStars/StdLibX.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/StdLibX/**/*"
  spec.exclude_files = "Sources/StdLibX/Foundation/System.swift", "Sources/StdLibX/SwiftUI/Color.swift"

  spec.frameworks = "Foundation", "SwiftUI"

end
