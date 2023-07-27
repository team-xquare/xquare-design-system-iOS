import SwiftUI

public struct XIconButton: View {

    @Binding var isDisabled: Bool
    var image: Image
    var action: () -> ()
    var type: XIconButtonType

    public init(
        isDisabled: Binding<Bool> = .constant(true),
        image: Image,
        action: @escaping () -> (),
        type: XIconButtonType = .filled
    ) {
        self._isDisabled = isDisabled
        self.image = image
        self.action = action
        self.type = type
    }
    
    public var body: some View {
        switch type {
        case .filled:
            Button(action: action) {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor( .Primary.onPrimary)
            }
            .xIconButtonStyle(.filled)
            .disabled(isDisabled)
        case .outlined:
            Button(action: action) {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isDisabled
                                     ? .Primary.primary.opacity(0.4)
                                     : .Primary.primary)
            }
            .xIconButtonStyle(.outlined)
            .disabled(isDisabled)
        case .icon:
            Button(action: action) {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isDisabled
                                     ? .Neutral.onSurface.opacity(0.4)
                                     : .Neutral.onSurface)
            }
            .xIconButtonStyle(.icon)
            .disabled(isDisabled)
        }
    }
}
// MARK: Preview
struct XIconButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            XIconButton(isDisabled: .constant(false), image: Image(systemName: "pencil.circle.fill"), action: { }, type: .filled)
            XIconButton(isDisabled: .constant(true), image: Image(systemName: "pencil.circle.fill"), action: { }, type: .filled)
            XIconButton(isDisabled: .constant(false), image: Image(systemName: "pencil.circle.fill"), action: { }, type: .outlined)
            XIconButton(isDisabled: .constant(true), image: Image(systemName: "pencil.circle.fill"), action: { }, type: .outlined)
            XIconButton(isDisabled: .constant(false), image: Image(systemName: "pencil.circle.fill"), action: { }, type: .icon)
            XIconButton(isDisabled: .constant(true), image: Image(systemName: "pencil.circle.fill"), action: { }, type: .icon)
            Spacer()
        }
    }
}
