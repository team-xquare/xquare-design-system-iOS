import SwiftUI

struct XTextFieldPlayground: View {
    @State var text1 = ""
    @State var text2 = ""
    var body: some View {
        VStack(spacing: 20) {
            XTextField(
                "아이디",
                text: $text1,
                xtfStyle: .supportText(),
                isError: false
            ) {
                
            }
            XTextField(
                "비밀번호",
                text: $text2,
                xtfStyle: .supportText(isSecure: true),
                isError: false
            ) {
                
            }
            .disabled(false)
        }
        .xBackground()
    }
}

struct XTextFieldPlayground_Previews: PreviewProvider {
    static var previews: some View {
        XTextFieldPlayground()
            .xBackground()
    }
}
