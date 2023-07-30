import SwiftUI

struct SurfaceModifier: ViewModifier {
    let maxSize: CGFloat

    init(maxSize: CGFloat) {
        self.maxSize = maxSize
    }

    func body(content: Content) -> some View {
        content
            .background {
                Color.Neutral.surface
                    .ignoresSafeArea()
            }
            .frame(maxWidth: maxSize, maxHeight: maxSize)
    }
}

public extension View {
    func xSurface(style: XSurfaceStyle) -> some View {
        modifier(SurfaceModifier(maxSize: style.rawValue))
    }
}
