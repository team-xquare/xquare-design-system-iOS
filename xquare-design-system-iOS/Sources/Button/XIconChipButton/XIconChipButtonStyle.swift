import SwiftUI
public struct XIconChipButtonStyle: ButtonStyle {
    var type: XIconChipButtonType
    
    public func makeBody(configuration: Configuration) -> some View {
        switch type {
        case .filled:
            AnyView(FilledIconChipButton(configuration: configuration))
        case .outlined:
            AnyView(OutlinedIconChipButton(configuration: configuration))
        }
    }
}

// MARK: - Usage
extension Button {
    func xIconChipButtonStyle (_ type: XIconChipButtonType) -> some View {
        self.buttonStyle(XIconChipButtonStyle(type: type))
    }
}


extension XIconChipButtonStyle {
    struct FilledIconChipButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor( .Secondary.onSecondary)
                .padding(4)
                .background(
                    isEnabled
                    ? Color.Secondary.secondary
                    : Color.Secondary.secondary.opacity(0.4)
                )
                .xCorner(.xSmall)
        }
    }
}


extension XIconChipButtonStyle {
    struct OutlinedIconChipButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .foregroundColor(
                    isEnabled
                    ? .Secondary.secondary
                    : .Secondary.secondary.opacity(0.4)
                )
                .padding(4)
                .background(
                    isEnabled
                    ? configuration.isPressed
                    ? Color.Secondary.secondaryContainer
                    : Color.Secondary.onSecondary
                    : Color.Secondary.onSecondary.opacity(0.4)
                )
                .xCorner(.xSmall)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(
                            isEnabled
                            ? Color.Secondary.secondary
                            : Color.Secondary.secondary.opacity(0.4),
                            lineWidth: 1
                        )
                }
        }
    }
}
