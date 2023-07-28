import SwiftUI
public struct XFloatingActionButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        AnyView(FilledFloatingActionButton(configuration: configuration))
    }
}

// MARK: - Usage
extension Button {
    func xFloatingActionButtonStyle () -> some View {
        self.buttonStyle(XFloatingActionButtonStyle())
    }
}


extension XFloatingActionButtonStyle {
    struct FilledFloatingActionButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.large),
                       weight: .medium,
                       color: .Tertiary.onTertiary
                )
                .padding(16)
                .background(
                    isEnabled
                    ? Color.Tertiary.tertiary
                    : Color.Tertiary.tertiary.opacity(0.4)
                )
                .xCorner(.large)
        }
    }
}
