import SwiftUI

struct ButtonPlaygroundView: View {
    @State var isDisable = false
    var body: some View {
        ScrollView {
            VStack {
                Toggle(
                    isOn: $isDisable,
                    label: {
                        Label("isDisable", systemImage: "xmark")
                    }
                )

                XButton(
                    "Filled 버튼",
                    icon: .filledHeart,
                    type: .filled,
                    action: {}
                )
                .disabled(isDisable)

                XButton(
                    "Outlined 버튼",
                    icon: .filledHeart,
                    type: .outlined,
                    action: {}
                )
                .disabled(isDisable)

                XButton(
                    "Text 버튼",
                    icon: .filledHeart,
                    type: .text,
                    action: {}
                )
                .disabled(isDisable)
                XIconButton(
                    icon: .filledHeart,
                    type: .filled,
                    action: {}
                )
                .disabled(isDisable)
                XIconButton(
                    icon: .filledHeart,
                    type: .outlined,
                    action: {}
                )
                .disabled(isDisable)
                XIconButton(
                    icon: .filledHeart,
                    type: .icon,
                    action: {}
                )
                .disabled(isDisable)
            }
        }
    }
}

struct ButtonPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlaygroundView()
    }
}
