import SwiftUI

public struct DesignSystemPlaygroundView: View {
    let list: [(String, AnyView)] = [
        ("Color", AnyView(ColorPlaygroundView())),
        ("Font", AnyView(FontPlaygroundView())),
        ("TextField", AnyView(TextFieldPlaygroundView())),
        ("Toast", AnyView(ToastPlaygroundView())),
        ("Button", AnyView(ButtonPlaygroundView())),
        ("CheckBox", AnyView(CheckboxPlaygroundView())),
        ("Switch", AnyView(SwitchPlaygroundView())),
        ("Alert", AnyView(AlertPlaygroundView())),
        ("BottomSheet", AnyView(BottomSheetPlaygrondView())),
        ("Divider", AnyView(DividerPlaygroundView())),
        ("DropDown", AnyView(DropDownPlaygroundView()))
    ]

    public init() {}

    public var body: some View {
        NavigationView {
            List(list, id: \.0) { item in
                NavigationLink {
                    item.1
                        .navigationBarTitle(
                            item.0 + " Playground",
                            displayMode: .inline
                        )
                } label: {
                    Text(item.0)
                }
            }
            .navigationTitle("DesignSystem")
        }
    }
}

struct DeisgnSystemPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        DesignSystemPlaygroundView()
            .onAppear {
                NotoSansKR.registerFonts()
            }
    }
}
