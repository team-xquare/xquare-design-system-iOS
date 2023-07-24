import SwiftUI

public extension Color {
    struct Secondary { }
}

public extension Color.Secondary {
    private static let secondary0: Color = Color(type: .secondary, 0)
    private static let secondary10: Color = Color(type: .secondary, 10)
    private static let secondary20: Color = Color(type: .secondary, 20)
    private static let secondary30: Color = Color(type: .secondary, 30)
    private static let secondary40: Color = Color(type: .secondary, 40)
    private static let secondary50: Color = Color(type: .secondary, 50)
    private static let secondary60: Color = Color(type: .secondary, 60)
    private static let secondary70: Color = Color(type: .secondary, 70)
    private static let secondary80: Color = Color(type: .secondary, 80)
    private static let secondary90: Color = Color(type: .secondary, 90)
    private static let secondary95: Color = Color(type: .secondary, 95)
    private static let secondary99: Color = Color(type: .secondary, 99)
    private static let secondary100: Color = Color(type: .secondary, 100)

    static let secondary: Color = secondary60.darkModeColor(secondary40)
    static let onSecondary: Color = secondary100.darkModeColor(secondary100)
    static let secondaryContainer: Color = secondary90.darkModeColor(secondary30)
    static let onSecondaryContainer: Color = secondary10.darkModeColor(secondary90)
}
