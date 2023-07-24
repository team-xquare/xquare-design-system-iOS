import SwiftUI

public extension Color {
    struct NeutralVariant { }
}

public extension Color.NeutralVariant {
    private static let neutralVariantl0: Color = Color(type: .neutralVariant, 0)
    private static let neutralVariant10: Color = Color(type: .neutralVariant, 10)
    private static let neutralVariant20: Color = Color(type: .neutralVariant, 20)
    private static let neutralVariant30: Color = Color(type: .neutralVariant, 30)
    private static let neutralVariant40: Color = Color(type: .neutralVariant, 40)
    private static let neutralVariant50: Color = Color(type: .neutralVariant, 50)
    private static let neutralVariant60: Color = Color(type: .neutralVariant, 60)
    private static let neutralVariant70: Color = Color(type: .neutralVariant, 70)
    private static let neutralVariant80: Color = Color(type: .neutralVariant, 80)
    private static let neutralVariant90: Color = Color(type: .neutralVariant, 90)
    private static let neutralVariant95: Color = Color(type: .neutralVariant, 95)
    private static let neutralVariant99: Color = Color(type: .neutralVariant, 99)
    private static let neutralVariant100: Color = Color(type: .neutralVariant, 100)

    static let surfaceVariant: Color = neutralVariant90.darkModeColor(neutralVariant30)
    static let onSurfaceVariant: Color = neutralVariant30.darkModeColor(neutralVariant80)
    static let outline: Color = neutralVariant50.darkModeColor(neutralVariant60)
    static let outlineVariant: Color = neutralVariant80.darkModeColor(neutralVariant30)
}
