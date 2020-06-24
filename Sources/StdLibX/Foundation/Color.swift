//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

import SwiftUI

@available(iOS 13, macOS 10.15, watchOS 6, tvOS 13, *)
extension Color {

    /// A color so close to clear that it does not appear, but it is still there.
    public static let notClear = Color.white.opacity(0.000001)

    /// Color by SwiftStars.
    public static let grayGreen = Color(#colorLiteral(red: 0.4156862745, green: 0.4980392157, blue: 0.5137254902, alpha: 1))

    /// Color by SwiftStars.
    public static let niceGreen = Color(#colorLiteral(red: 0.5725490196, green: 0.7490196078, blue: 0.7607843137, alpha: 1))

    /// Color by SwiftStars.
    public static let badGreen = Color(#colorLiteral(red: 0.4156862745, green: 0.4980392157, blue: 0, alpha: 1))

    /// Color by SwiftStars.
    public static let cactusGreen = Color(#colorLiteral(red: 0, green: 0.1803921569, blue: 0, alpha: 1))

    /// Color by SwiftStars.
    public static let peachPink = Color(#colorLiteral(red: 1, green: 0.4980392157, blue: 0.5137254902, alpha: 1))

    /// Color by SwiftStars.
    public static let coolPink = Color(#colorLiteral(red: 0.7411764706, green: 0, blue: 0.3921568627, alpha: 1))

    /// Color by SwiftStars.
    public static let lightPurple = Color(#colorLiteral(red: 0.7411764706, green: 0.7254901961, blue: 1, alpha: 1))

    /// Color by SwiftStars.
    public static let navyBlue = Color(#colorLiteral(red: 0, green: 0.3921568627, blue: 0.5137254902, alpha: 1))

}

@available(iOS 13, macOS 10.15, watchOS 6, tvOS 13, *)
extension Color {

    /// Color by Apple (in OSX Color Picker)
    public static let licorice = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let lead = Color(#colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let tungsten = Color(#colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let iron = Color(#colorLiteral(red: 0.368627451, green: 0.368627451, blue: 0.368627451, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let steel = Color(#colorLiteral(red: 0.4745098039, green: 0.4745098039, blue: 0.4745098039, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let tin = Color(#colorLiteral(red: 0.568627451, green: 0.568627451, blue: 0.568627451, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let nickel = Color(#colorLiteral(red: 0.5725490196, green: 0.5725490196, blue: 0.5725490196, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let aluminum = Color(#colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let magnesium = Color(#colorLiteral(red: 0.7529411765, green: 0.7529411765, blue: 0.7529411765, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let silver = Color(#colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let mercury = Color(#colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let snow = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))

    /// Color by Apple (in OSX Color Picker)
    public static let cayenne = Color(#colorLiteral(red: 0.5803921569, green: 0.06666666667, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let maraschino = Color(#colorLiteral(red: 1, green: 0.1490196078, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let salmon = Color(#colorLiteral(red: 1, green: 0.4941176471, blue: 0.4745098039, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let mocha = Color(#colorLiteral(red: 0.5803921569, green: 0.3215686275, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let Tangerine = Color(#colorLiteral(red: 1, green: 0.5764705882, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let cantaloupe = Color(#colorLiteral(red: 1, green: 0.831372549, blue: 0.4745098039, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let asparagus = Color(#colorLiteral(red: 0.5725490196, green: 0.5647058824, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let lemon = Color(#colorLiteral(red: 1, green: 0.9843137255, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let banana = Color(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.4745098039, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let fern = Color(#colorLiteral(red: 0.3098039216, green: 0.5607843137, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let lime = Color(#colorLiteral(red: 0.5568627451, green: 0.9803921569, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let honeydew = Color(#colorLiteral(red: 0.831372549, green: 0.9843137255, blue: 0.4745098039, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let clover = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let spring = Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let flora = Color(#colorLiteral(red: 0.4509803922, green: 0.9803921569, blue: 0.4745098039, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let moss = Color(#colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let seaFoam = Color(#colorLiteral(red: 0, green: 0.9803921569, blue: 0.5725490196, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let spinDrift = Color(#colorLiteral(red: 0.4509803922, green: 0.9882352941, blue: 0.8392156863, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let teal = Color(#colorLiteral(red: 0, green: 0.568627451, blue: 0.5764705882, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let turquoise = Color(#colorLiteral(red: 0, green: 0.9921568627, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let ice = Color(#colorLiteral(red: 0.4509803922, green: 0.9921568627, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let ocean = Color(#colorLiteral(red: 0, green: 0.3294117647, blue: 0.5764705882, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let aqua = Color(#colorLiteral(red: 0, green: 0.5882352941, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let sky = Color(#colorLiteral(red: 0.462745098, green: 0.8392156863, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let midnight = Color(#colorLiteral(red: 0.003921568627, green: 0.09803921569, blue: 0.5764705882, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let blueberry = Color(#colorLiteral(red: 0.01568627451, green: 0.2, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let orchrid = Color(#colorLiteral(red: 0.4784313725, green: 0.5058823529, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let eggplant = Color(#colorLiteral(red: 0.3254901961, green: 0.1058823529, blue: 0.5764705882, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let grape = Color(#colorLiteral(red: 0.5803921569, green: 0.2156862745, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let lavender = Color(#colorLiteral(red: 0.8431372549, green: 0.5137254902, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let plum = Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let magenta = Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let bubblegum = Color(#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let maroon = Color(#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let strawberry = Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))

    /// Color by Apple (in OSX Color Picker)
    public static let carnation = Color(#colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1))

}
