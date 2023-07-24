import SwiftUI

public extension View {
    func xCorner(_ type: CornerType) -> some View {
        self
            .modifier(XCorner(type))
    }
}

struct XCorner: ViewModifier {
    let type: CornerType
    init(_ type: CornerType) {
        self.type = type
    }

    func body(content: Content) -> some View {
        content
            .cornerRadius(type.rawValue)
    }

}
