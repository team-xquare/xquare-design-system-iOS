import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background {
                Color.Neutral.background
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func xBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
