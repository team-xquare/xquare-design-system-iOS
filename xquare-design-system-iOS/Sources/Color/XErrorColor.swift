import SwiftUI

public extension Color {
    struct Error { }
}

public extension Color.Error {
    private static let error40: Color = Color(type: .error, 40)
    private static let error60: Color = Color(type: .error, 60)

    static let error: Color = error60.darkModeColor(error40)
}
