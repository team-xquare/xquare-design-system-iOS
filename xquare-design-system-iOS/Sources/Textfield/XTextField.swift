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
    var textColor: Color {
        .Neutral.onSurface.opacity(isEnabled ? 1 : 0.4)
    }
    
    @State private var isSecure: Bool = false
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        xtfStyle: XTextfieldStyle = .default(),
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
            case let .default(isSecure),
                let .supportText(isSecure):
                if isSecure {
                    Button {
                        self.isSecure.toggle()
                    } label: {
                        Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                            .frame(width: 24, height: 24)
                            .foregroundColor(textColor)
                    }
                }

            case let .iconOnSuffix(icon, action),
                let .iconOnPrefixAndSuffix(_, icon, action):
                Button { action() } label: { icon }

            default:
                EmptyView()
            }
        }
        .frame(height: 48)
        .padding(.horizontal, 16)
        .background {
            switch xtfStyle {
            case .supportText:
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .trim(from: 0, to: 0.55)
                        .stroke(
                            textFieldBolderColor,
                            lineWidth: 1
                        )

                    RoundedRectangle(cornerRadius: 12)
                        .trim(from: 0.565 + (0.44 * (labelWidth / width)), to: 1)
                        .stroke(
                            textFieldBolderColor,
                            lineWidth: 1
                        )

                    Text(placeholder)
                        .xFont(
                            .label(.small),
                            weight: .regular,
                            color: textColor
                        )
                        .overlay(
                            GeometryReader { geo in
                                Color.clear.onAppear { labelWidth = geo.size.width }
                            }
                        )
                        .padding(2)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topLeading
                        )
                        .offset(x: 28, y: -10)
                }

            default:
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        textFieldBolderColor,
                        lineWidth: 1
                    )
            }
        }
        .overlay(
            GeometryReader { geo in
                Color.clear.onAppear { width = geo.size.width }
            }
        )
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
                    color: isEnabled
                    ? .NeutralVariant.outline
                    : .Neutral.onSurface.opacity(0.4)
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
                "아이디",
                text: .constant(""),
                xtfStyle: .supportText(),
                isError: false
            ) {
                
            }
            .disabled(false)
            XTextField(
                "비밀번호",
                text: .constant(""),
                xtfStyle: .supportText(isSecure: true),
                isError: false
            ) {
                
            }
            .disabled(false)
        }
    }
}
