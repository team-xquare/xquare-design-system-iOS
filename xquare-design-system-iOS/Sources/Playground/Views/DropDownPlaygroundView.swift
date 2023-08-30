import SwiftUI

struct DropDownPlaygroundView: View {
    @State var isShowDropDown: Bool = false
    @State var selectedOption: String = "홈"

    var body: some View {
        VStack {
            XButton(selectedOption, type: .filled) {
                self.isShowDropDown.toggle()
            }
            .xDropDown(
                $selectedOption,
                isShowDropDown: $isShowDropDown,
                options: [
                    "홈",
                    "일정",
                    "피드",
                    "신청",
                    "전체"
                ]
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}

struct DropDownPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownPlaygroundView()
    }
}
