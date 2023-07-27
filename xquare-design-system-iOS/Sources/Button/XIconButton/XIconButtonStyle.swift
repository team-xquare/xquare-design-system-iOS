import SwiftUI
public struct XIconButtonStyle: ButtonStyle {
    var type: XIconButtonType
    
    public func makeBody(configuration: Configuration) -> some View {
        switch type {
        case .filled:
            AnyView(FilledIconButton(configuration: configuration))
        case .outlined:
            AnyView(OutlinedIconButton(configuration: configuration))
        case .icon:
            AnyView(IconIconButton(configuration: configuration))
        }
    }
}

// MARK: - Usage
extension Button {
    func xIconButtonStyle(_ type: XIconButtonType) -> some View {
        self.buttonStyle(XIconButtonStyle(type: type))
    }
}


extension XIconButtonStyle {
    struct FilledIconButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .xFont(.body(.large),
                       weight: .medium,
                       color: .Primary.onPrimary)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(isEnabled ? Color.Primary.primary : Color.Primary.primary.opacity(0.4))
                .xCorner(.medium)
        }
    }
}


extension XIconButtonStyle {
    struct OutlinedIconButton: View {
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
                .background(isEnabled
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

extension XIconButtonStyle {
    struct IconIconButton: View {
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
                .background(isEnabled
                        ? configuration.isPressed
                        ? Color.Primary.primaryContainer
                        : Color.Primary.onPrimary
                        : Color.Primary.onPrimary.opacity(0.4)
                )
                .xCorner(.medium)
        }
    }
}
