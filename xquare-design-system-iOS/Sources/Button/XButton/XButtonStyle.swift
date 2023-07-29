import SwiftUI
public struct XButtonStyle: ButtonStyle {
    var type: XButtonType
    
    public func makeBody(configuration: Configuration) -> some View {
        switch type {
        case .filled:
            AnyView(FilledButton(configuration: configuration))
        case .outlined:
            AnyView(OutlinedButton(configuration: configuration))
        case .text:
            AnyView(TextButton(configuration: configuration))
        }
    }
}

// MARK: - Usage
extension Button {
    func xButtonStyle (_ type: XButtonType) -> some View {
        self.buttonStyle(XButtonStyle(type: type))
    }
}


extension XButtonStyle {
    struct FilledButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.large),
                       weight: .medium,
                       color: .Primary.onPrimary)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    isEnabled
                    ? Color.Primary.primary
                    : Color.Primary.primary.opacity(0.4)
                )
                .xCorner(.medium)
        }
    }
}


extension XButtonStyle {
    struct OutlinedButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.large),
                       weight: .medium,
                       color: isEnabled
                       ? .Primary.primary
                       : .Primary.primary.opacity(0.4))
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    isEnabled
                    ? configuration.isPressed
                    ? Color.Primary.primaryContainer
                    : Color.Primary.onPrimary
                    : Color.Primary.onPrimary.opacity(0.4)
                )
                .xCorner(.medium)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            isEnabled
                            ? Color.Primary.primary
                            : Color.Primary.primary.opacity(0.4),
                            lineWidth: 1
                        )
                }
        }
    }
}

extension XButtonStyle {
    struct TextButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.large),
                       weight: .medium,
                       color: isEnabled
                       ? .Neutral.onSurface
                       : .Neutral.onSurface.opacity(0.4))
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    isEnabled
                    ? configuration.isPressed
                    ? Color.Primary.primaryContainer
                    : Color.Primary.onPrimary
                    : Color.Primary.onPrimary.opacity(0.4)
                )
                .xCorner(.medium)
        }
    }
}
