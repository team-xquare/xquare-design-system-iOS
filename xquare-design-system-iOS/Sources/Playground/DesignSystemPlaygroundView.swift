import SwiftUI

public struct DesignSystemPlaygroundView: View {
    let list: [(String, AnyView)] = [
        ("Color", AnyView(ColorPlaygroundView())),
        ("Font", AnyView(FontPlaygroundView())),
        ("TextField", AnyView(TextFieldPlaygroundView())),
        ("Toast", AnyView(ToastPlaygroundView()))
    ]

    public init() {}

    public var body: some View {
        NavigationView {
            List(list, id: \.0) { item in
                NavigationLink {
                    item.1
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
    }
}
