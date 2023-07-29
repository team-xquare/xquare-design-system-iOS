import SwiftUI

struct BackdropView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView()
        let blur = UIBlurEffect()
        let animator = UIViewPropertyAnimator()
        animator.addAnimations { view.effect = blur }
        animator.fractionComplete = 0
        animator.stopAnimation(false)
        animator.finishAnimation(at: .current)
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
    
}

public extension View {
    func xBlur(radius: CGFloat) -> some View {
        self
            .modifier(XBlur(radius: radius))
    }
}

struct XBlur: ViewModifier {
    let radius: CGFloat
    init(radius: CGFloat) {
        self.radius = radius / 2
    }

    func body(content: Content) -> some View {
        ZStack {
            Color.Neutral.background.opacity(0.1).ignoresSafeArea()

            BackdropView().blur(radius: radius)

            content
        }
        .background(Background())
    }

}
