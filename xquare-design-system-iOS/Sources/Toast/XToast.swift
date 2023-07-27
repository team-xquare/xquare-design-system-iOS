import SwiftUI

struct XToast: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let icon: XImage.Image?
    let shadowStyle: XShadowStyle

    init(
        isShowing: Binding<Bool>,
        message: String,
        icon: XImage.Image?,
        shadowStyle: XShadowStyle = .low
    ) {
        _isShowing = isShowing
        self.message = message
        self.icon = icon
        self.shadowStyle = shadowStyle
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            xToastView()
        }
        .onChange(of: isShowing) {
            if $0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isShowing = false
                }
            }
        }
    }

    @ViewBuilder
    private func xToastView() -> some View {
        VStack {
            if isShowing {
                HStack(spacing: 8) {
                    if let icon {
                        XImage(icon, renderingMode: .template)
                            .foregroundColor(.Neutral.surface)
                    }

                    Text(message)
                        .xFont(.body(.large), color: .Neutral.surface)

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.Neutral.onSurface)
                .cornerRadius(12)
                .xShadow(style: shadowStyle)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.5))
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .top),
                        removal: .opacity
                            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.5))
                    )
                )
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .onTapGesture {
                    isShowing = false
                }
            }

            Spacer()
        }
    }
}

public extension View {
    func xToast(
        isShowing: Binding<Bool>,
        message: String,
        icon: XImage.Image?,
        shadowStyle: XShadowStyle = .low
    ) -> some View {
        modifier(XToast(isShowing: isShowing, message: message, icon: icon, shadowStyle: shadowStyle))
    }
}
