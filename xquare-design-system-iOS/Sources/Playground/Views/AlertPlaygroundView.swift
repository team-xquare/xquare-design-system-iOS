import SwiftUI

struct AlertPlaygroundView: View {
    @State var alert1 = false
    @State var alert2 = false
    var body: some View {
        ScrollView {
            VStack {
                XButton(
                    "Single Alert",
                    type: .filled,
                    action: { self.alert1.toggle() }
                )

                XButton(
                    "Double Alert",
                    type: .filled,
                    action: { self.alert2.toggle() }
                )
            }
        }
        .xAlert(isPresented: $alert1) {
            XAlert(
                title: "title",
                content: "content",
                type: .single(
                    button: .init(text: "button", action: {})
                )
            )
        }
        .xAlert(isPresented: $alert2) {
            XAlert(
                title: "title",
                content: "content",
                type: .double(
                    button1: .init(text: "button1", action: {}),
                    button2: .init(text: "button2", action: {})
                )
            )
        }
    }
}

struct AlertPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        AlertPlaygroundView()
    }
}
