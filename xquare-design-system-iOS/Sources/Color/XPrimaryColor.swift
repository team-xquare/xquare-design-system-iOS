import SwiftUI

public extension Color {
    struct Primary { }
}

public extension Color.Primary {
    private static let primary0: Color = Color(type: .primary, 0)
    private static let primary10: Color = Color(type: .primary, 10)
    private static let primary20: Color = Color(type: .primary, 20)
    private static let primary30: Color = Color(type: .primary, 30)
    private static let primary40: Color = Color(type: .primary, 40)
    private static let primary50: Color = Color(type: .primary, 50)
    private static let primary60: Color = Color(type: .primary, 60)
    private static let primary70: Color = Color(type: .primary, 70)
    private static let primary80: Color = Color(type: .primary, 80)
    private static let primary90: Color = Color(type: .primary, 90)
    private static let primary95: Color = Color(type: .primary, 95)
    private static let primary99: Color = Color(type: .primary, 99)
    private static let primary100: Color = Color(type: .primary, 100)

    static let primary: Color = primary60.darkModeColor(primary40)
    static let onPrimary: Color = primary100.darkModeColor(primary100)
    static let primaryContainer: Color = primary90.darkModeColor(primary30)
    static let onPrimaryContainer: Color = primary10.darkModeColor(primary90)
}
