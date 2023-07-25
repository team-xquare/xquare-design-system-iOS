import SwiftUI

public extension View {
    func xCorner(_ type: XCornerStyle) -> some View {
        self
            .modifier(XCorner(type))
    }
}

struct XCorner: ViewModifier {
    let type: XCornerStyle
    init(_ type: XCornerStyle) {
        self.type = type
    }

    func body(content: Content) -> some View {
        content
            .cornerRadius(type.rawValue)
    }

}
