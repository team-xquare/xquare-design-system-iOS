import SwiftUI

protocol XFontable {
    var size: FontSize { get }
}

public struct FontSize {
    var size: CGFloat
    var lineSpacing: CGFloat

    init(size: CGFloat, lineSpacing: CGFloat) {
        self.size = size
        self.lineSpacing = lineSpacing - size
    }
}

public enum XFontWeight: String, CaseIterable {
    case black = "Black"
    case bold = "Bold"
    case light = "Light"
    case medium = "Medium"
    case regular = "Regular"
    case thin = "Thin"
}

public enum XFontStyle: Hashable, XFontable {
    case display(XFontStyle.SizeStyle)
    case headline(XFontStyle.SizeStyle)
    case title(XFontStyle.SizeStyle)
    case body(XFontStyle.SizeStyle)
    case label(XFontStyle.SizeStyle)

    public enum SizeStyle {
        case large
        case medium
        case small
    }
}

extension XFontStyle {
    var size: FontSize {
        switch self {
        case let .display(sizeStyle):
            switch sizeStyle {
            case .large:
                return .init(size: 57, lineSpacing: 64)

            case .medium:
                return .init(size: 45, lineSpacing: 52)

            case .small:
                return .init(size: 36, lineSpacing: 44)
            }

        case let .headline(sizeStyle):
            switch sizeStyle {
            case .large:
                return .init(size: 32, lineSpacing: 48)

            case .medium:
                return .init(size: 28, lineSpacing: 36)

            case .small:
                return .init(size: 24, lineSpacing: 32)
            }

        case let .title(sizeStyle):
            switch sizeStyle {
            case .large:
                return .init(size: 22, lineSpacing: 28)

            case .medium:
                return .init(size: 16, lineSpacing: 24)

            case .small:
                return .init(size: 14, lineSpacing: 20)
            }

        case let .body(sizeStyle):
            switch sizeStyle {
            case .large:
                return .init(size:16, lineSpacing: 20)

            case .medium:
                return .init(size: 14, lineSpacing: 16)

            case .small:
                return .init(size: 12, lineSpacing: 16)
            }

        case let .label(sizeStyle):
            switch sizeStyle {
            case .large:
                return .init(size: 14, lineSpacing: 24)

            case .medium:
                return .init(size: 12, lineSpacing: 20)

            case .small:
                return .init(size: 11, lineSpacing: 16)
            }
        }
    }
}
