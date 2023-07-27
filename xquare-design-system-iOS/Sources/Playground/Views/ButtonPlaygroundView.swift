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
                    style: .filled,
                    action: {}
                )
                .disabled(isDisable)

                XButton(
                    "Outlined 버튼",
                    icon: .filledHeart,
                    style: .outlined,
                    action: {}
                )
                .disabled(isDisable)

                XButton(
                    "Text 버튼",
                    icon: .filledHeart,
                    style: .text,
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
