import SwiftUI

public struct XFloatingActionButton: View {
    var text: String?
    var icon: XImage.Image
    var action: () -> ()

    public init(
        text: String? = nil,
        icon: XImage.Image,
        action: @escaping () -> ()
    ) {
        self.text = text
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                XImage(icon, renderingMode: .template)
                
                if let text {
                    Text(text)
                }
            }
        }
        .xFloatingActionButtonStyle()
    }
}

struct XFloatingActionButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            XFloatingActionButton(
                icon: .outlinedFeed,
                action: { }
            )

            XFloatingActionButton(
                icon: .outlinedFeed,
                action: { }
            )
            .disabled(true)

            XFloatingActionButton(
                text: "Enabled",
                icon: .outlinedFeed,
                action: { }
            )

            XFloatingActionButton(
                text: "Disabled",
                icon: .outlinedFeed,
                action: { }
            )
            .disabled(true)
        }
    }
}
