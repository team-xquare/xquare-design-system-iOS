import SwiftUI

public extension Color {
    struct Error { }
}

public extension Color.Error {
    private static let error0: Color = Color(type: .error, 0)
    private static let error10: Color = Color(type: .error, 10)
    private static let error20: Color = Color(type: .error, 20)
    private static let error30: Color = Color(type: .error, 30)
    private static let error40: Color = Color(type: .error, 40)
    private static let error50: Color = Color(type: .error, 50)
    private static let error60: Color = Color(type: .error, 60)
    private static let error70: Color = Color(type: .error, 70)
    private static let error80: Color = Color(type: .error, 80)
    private static let error90: Color = Color(type: .error, 90)
    private static let error95: Color = Color(type: .error, 95)
    private static let error99: Color = Color(type: .error, 99)
    private static let error100: Color = Color(type: .error, 100)

    static let error: Color = error60.darkModeColor(error40)
    static let onError: Color = error100.darkModeColor(error100)
    static let errorContainer: Color = error90.darkModeColor(error30)
    static let onErrorContainer: Color = error10.darkModeColor(error90)
}
