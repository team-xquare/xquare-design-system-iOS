import SwiftUI

public struct XButton: View {
    var text: String
    var icon: XImage.Image?
    var type: XButtonType
    var action: () -> ()

    public init(
        _ text: String,
        icon: XImage.Image?,
        type: XButtonType = .filled,
        action: @escaping () -> ()
    ) {
        self.text = text
        self.icon = icon
        self.action = action
        self.type = type
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let icon {
                    XImage(icon, renderingMode: .template)
                }
                Text(text)
            }
        }
        .xButtonStyle(type)
    }
}
// MARK: Preview
struct XButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            XButton(
                "Filled 버튼",
                icon: .filledHeart,
                type: .filled,
                action: {}
            )
            XButton(
                "Outlined 버튼",
                icon: .filledHeart,
                type: .outlined,
                action: {}
            )
            XButton(
                "Text 버튼",
                icon: .filledHeart,
                type: .text,
                action: {}
            )
        }
    }
}
