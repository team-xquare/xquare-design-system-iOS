import SwiftUI

public extension Color {
    struct Error { }
}

public extension Color.Error {
    static let error50: Color = Color("Error 50", bundle: Bundle.module)
}
