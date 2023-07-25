import SwiftUI

public struct XSecureTextField: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var placeholder: String
    @Binding var text: String
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
    
    @State private var isSecure: Bool = false

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        isError: Bool = false,
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        _text = text
        self.isError = isError
        self.onCommit = onCommit
    }

    public var body: some View {
        HStack(spacing: 8) {
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
            
            Spacer()

            Button {
                isSecure.toggle()
            } label: {
                Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                    .frame(width: 24, height: 24)
                    .foregroundColor(
                        .Neutral.onSurface
                            .opacity(isEnabled ? 1 : 0.4)
                    )
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
}

struct XSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            XSecureTextField(
                "hiasdfasd",
                text: .constant(""),
                isError: false
            ) {
                
            }
            .disabled(false)
            .padding()

            XSecureTextField(
                "hiasdfasd",
                text: .constant("hiasdfasd"),
                isError: false
            ) {
                
            }
            .disabled(false)
            .padding()
        }
    }
}
