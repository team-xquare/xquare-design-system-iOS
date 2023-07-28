import SwiftUI
public struct XChipButtonStyle: ButtonStyle {
    var type: XChipButtonType
    
    public func makeBody(configuration: Configuration) -> some View {
        switch type {
        case .filled:
            AnyView(FilledChipButton(configuration: configuration))
        case .outlined:
            AnyView(OutlinedChipButton(configuration: configuration))
        }
    }
}

// MARK: - Usage
extension Button {
    func xChipButtonStyle (_ type: XChipButtonType) -> some View {
        self.buttonStyle(XChipButtonStyle(type: type))
    }
}


extension XChipButtonStyle {
    struct FilledChipButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.medium),
                       weight: .regular,
                       color: .Secondary.onSecondary)
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


extension XChipButtonStyle {
    struct OutlinedChipButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.medium),
                       weight: .regular,
                       color: isEnabled
                       ? .Secondary.secondary
                       : .Secondary.secondary.opacity(0.4))
                .padding(4)
                .background(
                    isEnabled
                    ? configuration.isPressed
                    ? Color.Secondary.secondaryContainer
                    : Color.Primary.onPrimary
                    : Color.Primary.onPrimary.opacity(0.4)
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
