import SwiftUI

public extension Color {
    struct Tertiary{ }
}

public extension Color.Tertiary{
    private static let tertiary0: Color = Color(type: .tertiary, 0)
    private static let tertiary10: Color = Color(type: .tertiary, 10)
    private static let tertiary20: Color = Color(type: .tertiary, 20)
    private static let tertiary30: Color = Color(type: .tertiary, 30)
    private static let tertiary40: Color = Color(type: .tertiary, 40)
    private static let tertiary50: Color = Color(type: .tertiary, 50)
    private static let tertiary60: Color = Color(type: .tertiary, 60)
    private static let tertiary70: Color = Color(type: .tertiary, 70)
    private static let tertiary80: Color = Color(type: .tertiary, 80)
    private static let tertiary90: Color = Color(type: .tertiary, 90)
    private static let tertiary95: Color = Color(type: .tertiary, 95)
    private static let tertiary99: Color = Color(type: .tertiary, 99)
    private static let tertiary100: Color = Color(type: .tertiary, 100)

    static let tertiary: Color = tertiary60.darkModeColor(tertiary40)
    static let onTertiary: Color = tertiary100.darkModeColor(tertiary100)
    static let tertiaryContainer: Color = tertiary90.darkModeColor(tertiary30)
    static let onTertiaryContainer: Color = tertiary10.darkModeColor(tertiary90)
}
