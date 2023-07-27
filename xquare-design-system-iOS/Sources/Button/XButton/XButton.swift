import SwiftUI

public struct XButton: View {

    @Binding var isDisabled: Bool
    var image: Image?
    var text: String
    var action: () -> ()
    var type: XButtonType

    public init(
        isDisabled: Binding<Bool> = .constant(true),
        image: Image? = nil,
        text: String,
        action: @escaping () -> (),
        type: XButtonType = .filled
    ) {
        self._isDisabled = isDisabled
        self.image = image
        self.text = text
        self.action = action
        self.type = type
    }

    public var body: some View {
        switch type {
        case .filled:
            Button(action: action) {
                HStack(spacing: 8) {
                    if let image = image {
                        image
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor( .Primary.onPrimary)
                    }
                    Text(text)
                }
            }
            .xButtonStyle(.filled)
            .disabled(isDisabled)
        case .outlined:
            Button(action: action) {
                HStack(spacing: 8) {
                    if let image = image {
                        image
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(isDisabled
                                             ? .Primary.primary.opacity(0.4)
                                             : .Primary.primary)
                    }
                    Text(text)
                }
            }
            .xButtonStyle(.outlined)
            .disabled(isDisabled)
        case .text:
            Button(action: action) {
                HStack(spacing: 8) {
                    if let image = image {
                        image
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(isDisabled
                                             ? .Neutral.onSurface.opacity(0.4)
                                             : .Neutral.onSurface)
                    }
                    Text(text)
                }
            }
            .xButtonStyle(.text)
            .disabled(isDisabled)
        }
    }
}
// MARK: Preview
struct XButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            XButton(isDisabled: .constant(false), image: Image(systemName: "pencil.circle.fill"), text: "Enabled", action: { print("sadfq") }, type: .text)
            XButton(isDisabled: .constant(true), image: Image(systemName: "pencil.circle.fill"), text: "Enabled", action: { print("sadfq") }, type: .text)
            XButton(isDisabled: .constant(false), image: Image(systemName: "pencil.circle.fill"), text: "Enabled", action: { print("sadfq") }, type: .outlined)
            XButton(isDisabled: .constant(true), image: Image(systemName: "pencil.circle.fill"), text: "Enabled", action: { print("sadfq") }, type: .outlined)
            XButton(isDisabled: .constant(false), image: Image(systemName: "pencil.circle.fill"), text: "Enabled", action: { print("sadfq") }, type: .filled)
            XButton(isDisabled: .constant(true), image: Image(systemName: "pencil.circle.fill"), text: "Enabled", action: { print("sadfq") }, type: .filled)
            VStack {
                HStack{
                    
                    XButton(isDisabled: .constant(false), text: "Enabled", action: { print("sadfq") }, type: .text)
                    XButton(isDisabled: .constant(true), text: "Enabled", action: { print("sadfq") }, type: .text)
                    XButton(isDisabled: .constant(false), text: "Enabled", action: { print("sadfq") }, type: .outlined)
                }
                HStack {
                    XButton(isDisabled: .constant(true), text: "Enabled", action: { print("sadfq") }, type: .outlined)
                    XButton(isDisabled: .constant(false), text: "Enabled", action: { print("sadfq") }, type: .filled)
                    XButton(isDisabled: .constant(true), text: "Enabled", action: { print("sadfq") }, type: .filled)
                }
            }
            Spacer()
        }
    }
}
