import SwiftUI

public struct XTextField: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var placeholder: String
    @Binding var text: String
    var xtfStyle: XTextfieldStyle
    var isError: Bool
    var onCommit: () -> Void
    @FocusState var isFocused: Bool
    var textFieldBolderColor: Color {
        isEnabled ?
        isFocused ? .Secondary.secondary
        : isError ? .Error.error
        : .Neutral.onSurface
        : .Neutral.onSurface.opacity(0.4)
    }
    
    @State var isSecure: Bool = false

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        xtfStyle: XTextfieldStyle = .default,
        isError: Bool = false,
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        _text = text
        self.xtfStyle = xtfStyle
        self.isError = isError
        self.onCommit = onCommit
    }

    public var body: some View {
        HStack(spacing: 8) {
            switch xtfStyle {
            case let .iconOnPrefix(icon, action),
                let .iconOnPrefixAndSuffix(_, icon, action):
                Button { action() } label: { icon }
            default:
                EmptyView()
            }

            xTextField()
            
            Spacer()

            switch xtfStyle {
            case let .iconOnSuffix(icon, action),
                let .iconOnPrefixAndSuffix(_, icon, action):
                Button { action() } label: { icon }
            default:
                EmptyView()
            }
        }
        .frame(height: 48)
        .padding(.horizontal, 16)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(
                    textFieldBolderColor,
                    lineWidth: 1
                )
        }
        .animation(.easeIn(duration: 0.3), value: isError)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }

    @ViewBuilder
    func xTextField() -> some View {
        ZStack(alignment: .leading) {
            Group {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .accentColor(.Primary.primary)
            .xFont(
                .body(.large),
                color: .Neutral.onSurface.opacity(isEnabled ? 1 : 0.4)
            )
            .focused($isFocused)
            .onSubmit(onCommit)

            Text(placeholder)
                .xFont(
                    .body(.large),
                    color: .NeutralVariant.outline
                )
                .opacity(text.isEmpty ? 1 : 0)
                .onTapGesture {
                    isFocused = true
                }
        }
    }
}

struct XTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            XTextField(
                "hiasdfasd",
                text: .constant(""),
                xtfStyle: .default,
                isError: false
            ) {
                
            }
            .disabled(false)
            .padding()

            XTextField(
                "hiasdfasd",
                text: .constant("hiasdfasd"),
                xtfStyle: .default,
                isError: false
            ) {
                
            }
            .disabled(false)
            .padding()
        }
    }
}
