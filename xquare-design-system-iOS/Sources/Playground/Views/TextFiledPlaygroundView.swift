import SwiftUI

struct TextFieldPlaygroundView: View {
    @State var text1 = "asdfdsaf"
    @State var text2 = ""
    @State var text3 = "asdfdas"
    @State var isError1 = false

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                XTextField(
                    "아이디",
                    text: $text1,
                    xtfStyle: .default()
                )

                XTextField(
                    "비밀번호",
                    text: $text2,
                    xtfStyle: .default(isSecure: true)
                )
                
                XTextField(
                    "아이디",
                    text: $text1,
                    xtfStyle: .default()
                )
                .disabled(true)

                XTextField(
                    "비밀번호",
                    text: $text2,
                    xtfStyle: .default(isSecure: true)
                )
                .disabled(true)

                XTextField(
                    "Error",
                    text: $text3,
                    isError: isError1
                ) {
                    isError1.toggle()
                }
            }
            .padding()
        }
    }
}

struct TextFieldPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPlaygroundView()
    }
}
