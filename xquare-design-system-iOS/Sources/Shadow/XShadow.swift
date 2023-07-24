import SwiftUI

public struct XShadow: ViewModifier {
    public var style: XShadowStyle

    public func body(content: Content) -> some View {
        content
            .shadow(
                color: .black.opacity(0.25),
                blur: style == .high ? 3 : style == .medium ? 16: 24
            )
    }
}

public extension View {
    func xShadow(
        style: XShadowStyle
    ) -> some View {
        modifier(XShadow(style: style))
    }
}
