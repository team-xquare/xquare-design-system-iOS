import SwiftUI

public struct XFont: ViewModifier {
    public var style: XFontStyle
    public var weight: XFontWeight

    public func body(content: Content) -> some View {
        content
            .font(.custom("NotoSansKR-\(weight.rawValue)", size: style.size.size))
            .lineSpacing(style.size.lineSpacing)
    }
}

public extension View {
    func xFont(_ style: XFontStyle, weight: XFontWeight = .medium) -> some View {
        self
            .modifier(XFont(style: style, weight: weight))
    }

    func xFont(_ style: XFontStyle, weight: XFontWeight = .medium, color: Color) -> some View {
        self
            .xFont(style, weight: weight)
            .foregroundColor(color)
    }
}
