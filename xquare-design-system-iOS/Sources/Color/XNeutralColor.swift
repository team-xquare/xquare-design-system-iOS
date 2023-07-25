import SwiftUI

public extension Color {
    struct Neutral { }
}

public extension Color.Neutral {
    private static let neutral0: Color = Color(type: .neutral, 0)
    private static let neutral10: Color = Color(type: .neutral, 10)
    private static let neutral20: Color = Color(type: .neutral, 20)
    private static let neutral30: Color = Color(type: .neutral, 30)
    private static let neutral40: Color = Color(type: .neutral, 40)
    private static let neutral50: Color = Color(type: .neutral, 50)
    private static let neutral60: Color = Color(type: .neutral, 60)
    private static let neutral70: Color = Color(type: .neutral, 70)
    private static let neutral80: Color = Color(type: .neutral, 80)
    private static let neutral90: Color = Color(type: .neutral, 90)
    private static let neutral95: Color = Color(type: .neutral, 95)
    private static let neutral99: Color = Color(type: .neutral, 99)
    private static let neutral100: Color = Color(type: .neutral, 100)

    static let background: Color = neutral99.darkModeColor(neutral0)
    static let onBackground: Color = neutral10.darkModeColor(neutral90)
    static let surface: Color = neutral100.darkModeColor(neutral0)
    static let onSurface: Color = neutral0.darkModeColor(neutral100)
}
