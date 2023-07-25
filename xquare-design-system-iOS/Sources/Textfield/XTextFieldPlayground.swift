import SwiftUI

struct XTextFieldPlayground: View {
    @State var text = ""
    var body: some View {
        VStack {
            XTextField(
                "placeholder",
                text: $text,
                xtfStyle: .iconOnPrefixAndSuffix(
                    prefix: Image(systemName: "house"),
                    suffix: Image(systemName: "house"),
                    action: {
                        print("asdf")
                    }
                ),
                isError: false
            ) {
                print("on commit")
            }
            XSecureTextField(
                "placeholder",
                text: $text,
                isError: false
            ) {
                print("on commit")
            }
        }
    }
}

struct XTextFieldPlayground_Previews: PreviewProvider {
    static var previews: some View {
        XTextFieldPlayground()
            .xBackground()
    }
}
