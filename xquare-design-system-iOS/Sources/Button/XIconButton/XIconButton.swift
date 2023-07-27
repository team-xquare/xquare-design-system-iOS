import SwiftUI

public struct XIconButton: View {
    var icon: XImage.Image
    var type: XIconButtonType
    var action: () -> ()

    public init(
        icon: XImage.Image,
        type: XIconButtonType = .filled,
        action: @escaping () -> ()
    ) {
        self.icon = icon
        self.type = type
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            XImage(icon, renderingMode: .template)
        }
        .xIconButtonStyle(type)
    }
}
// MARK: Preview
struct XIconButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            XIconButton(
                icon: .filledDashboard,
                type: .filled,
                action: { }
            )
            XIconButton(
                icon: .filledDashboard,
                type: .outlined,
                action: { }
            )
            XIconButton(
                icon: .filledDashboard,
                type: .icon,
                action: { }
            )
            Spacer()
        }
    }
}
