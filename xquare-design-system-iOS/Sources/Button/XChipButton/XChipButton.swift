import SwiftUI

public struct XChipButton: View {
    var text: String
    var leftIcon: XImage.Image?
    var rightIcon: XImage.Image?
    var type: XChipButtonType
    var action: () -> ()

    public init(
        _ text: String,
        leftIcon: XImage.Image? = nil,
        rightIcon: XImage.Image? = nil,
        type: XChipButtonType = .filled,
        action: @escaping () -> ()
    ) {
        self.text = text
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.type = type
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if let leftIcon {
                    XImage(leftIcon, renderingMode: .template)
                }
                
                Text(text)
                
                if let rightIcon {
                    XImage(rightIcon, renderingMode: .template)
                }
            }
        }
        .xChipButtonStyle(type)
    }
}
// MARK: Preview
struct XChipButton_Preview: PreviewProvider {
    static var previews: some View {
        HStack {
            VStack {
                XChipButton(
                    "Enabled",
                    type: .filled,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    type: .filled,
                    action: { }
                )
                .disabled(true)
                XChipButton(
                    "Enabled",
                    rightIcon: .filledGear,
                    type: .filled,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    rightIcon: .filledGear,
                    type: .filled,
                    action: { }
                )
                .disabled(true)
                XChipButton(
                    "Enabled",
                    leftIcon: .filledGear,
                    type: .filled,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    leftIcon: .filledGear,
                    type: .filled,
                    action: { }
                )
                .disabled(true)
                XChipButton(
                    "Enabled",
                    leftIcon: .filledGear,
                    rightIcon: .filledGear,
                    type: .filled,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    leftIcon: .filledGear,
                    rightIcon: .filledGear,
                    type: .filled,
                    action: { }
                )
                .disabled(true)
                
            }
            VStack {
                XChipButton(
                    "Enabled",
                    type: .outlined,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    type: .outlined,
                    action: { }
                )
                .disabled(true)
                XChipButton(
                    "Enabled",
                    rightIcon: .filledGear,
                    type: .outlined,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    rightIcon: .filledGear,
                    type: .outlined,
                    action: { }
                )
                .disabled(true)
                XChipButton(
                    "Enabled",
                    leftIcon: .filledGear,
                    type: .outlined,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    leftIcon: .filledGear,
                    type: .outlined,
                    action: { }
                )
                .disabled(true)
                XChipButton(
                    "Enabled",
                    leftIcon: .filledGear,
                    rightIcon: .filledGear,
                    type: .outlined,
                    action: { }
                )
                XChipButton(
                    "Disabled",
                    leftIcon: .filledGear,
                    rightIcon: .filledGear,
                    type: .outlined,
                    action: { }
                )
                .disabled(true)
            }
        }
    }
}
