import SwiftUI

public extension Color {
    struct Neutral { }
}

public extension Color.Neutral {
    private static let neutral0: Color = Color(type: .netural, 0)
    private static let neutral10: Color = Color(type: .netural, 10)
    private static let neutral20: Color = Color(type: .netural, 20)
    private static let neutral30: Color = Color(type: .netural, 30)
    private static let neutral40: Color = Color(type: .netural, 40)
    private static let neutral50: Color = Color(type: .netural, 50)
    private static let neutral60: Color = Color(type: .netural, 60)
    private static let neutral70: Color = Color(type: .netural, 70)
    private static let neutral80: Color = Color(type: .netural, 80)
    private static let neutral90: Color = Color(type: .netural, 90)
    private static let neutral95: Color = Color(type: .netural, 95)
    private static let neutral99: Color = Color(type: .netural, 99)
    private static let neutral100: Color = Color(type: .netural, 100)

    static let backGround: Color = neutral99.darkModeColor(neutral0)
    static let onBackGround: Color = neutral10.darkModeColor(neutral90)
    static let surface: Color = neutral100.darkModeColor(neutral0)
    static let onSurface: Color = neutral0.darkModeColor(neutral100)
}
