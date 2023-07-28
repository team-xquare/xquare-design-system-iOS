import SwiftUI

public struct XIconChipButton: View {
    var icon: XImage.Image
    var type: XIconChipButtonType
    var action: () -> ()

    public init(
        icon: XImage.Image,
        type: XIconChipButtonType = .filled,
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
        .xIconChipButtonStyle(type)
    }
}
// MARK: Preview
struct XIconChipButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            XIconChipButton(
                icon: .filledGear,
                type: .filled,
                action: { }
            )
            XIconChipButton(
                icon: .filledGear,
                type: .filled,
                action: { }
            )
            .disabled(true)
            XIconChipButton(
                icon: .filledGear,
                type: .outlined,
                action: { }
            )
            XIconChipButton(
                icon: .filledGear,
                type: .outlined,
                action: { }
            )
            .disabled(true)
        }
    }
}
