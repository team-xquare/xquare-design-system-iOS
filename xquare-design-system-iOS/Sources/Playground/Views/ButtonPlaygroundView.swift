import SwiftUI

struct ButtonPlaygroundView: View {
    @State var isDisable = false
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Toggle(
                    isOn: $isDisable,
                    label: {
                        Label("isDisable", systemImage: "xmark")
                    }
                )
                HStack {
                    VStack {
                        Text("XButton")
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
                    }
                    VStack {
                        Text("XIconButton")
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
                VStack {
                    Text("XChipButton")
                    HStack {
                        VStack {
                            XChipButton(
                                "Filled",
                                type: .filled,
                                action: { }
                            )
                            .disabled(isDisable)
                            XChipButton(
                                "Filled",
                                rightIcon: .filledGear,
                                type: .filled,
                                action: { }
                            )
                            .disabled(isDisable)
                            XChipButton(
                                "Filled",
                                leftIcon: .filledGear,
                                type: .filled,
                                action: { }
                            )
                            .disabled(isDisable)
                            XChipButton(
                                "Filled",
                                leftIcon: .filledGear,
                                rightIcon: .filledGear,
                                type: .filled,
                                action: { }
                            )
                            .disabled(isDisable)
                        }
                        VStack {
                            XChipButton(
                                "Outlined",
                                type: .outlined,
                                action: { }
                            )
                            .disabled(isDisable)
                            XChipButton(
                                "Outlined",
                                rightIcon: .filledGear,
                                type: .outlined,
                                action: { }
                            )
                            .disabled(isDisable)
                            XChipButton(
                                "Outlined",
                                leftIcon: .filledGear,
                                type: .outlined,
                                action: { }
                            )
                            .disabled(isDisable)
                            XChipButton(
                                "Outlined",
                                leftIcon: .filledGear,
                                rightIcon: .filledGear,
                                type: .outlined,
                                action: { }
                            )
                            .disabled(isDisable)
                        }
                    }
                }
                HStack {
                    VStack {
                        Text("XIconChipButton")
                        XIconChipButton(
                            icon: .filledGear,
                            type: .filled,
                            action: { }
                        )
                        .disabled(isDisable)
                        XIconChipButton(
                            icon: .filledGear,
                            type: .outlined,
                            action: { }
                        )
                        .disabled(isDisable)
                    }
                    VStack {
                        Text("XFloatingActionButton")
                        XFloatingActionButton(
                            icon: .filledMenu,
                            action: { }
                        )
                        .disabled(isDisable)
                        XFloatingActionButton(
                            text: "Filled",
                            icon: .filledMenu,
                            action: { }
                        )
                        .disabled(isDisable)
                    }
                }
            }
        }
    }
}

struct ButtonPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlaygroundView()
    }
}
