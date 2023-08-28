import SwiftUI

struct DropDownPlaygroundView: View {
    @State var showDropDown: Bool = false
    @State var selectedOptions: String = "홈"

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
//                XTextField("Sdf", text: $selectedOptions, xtfStyle: .default())
//                    .onTapGesture {
//                        self.showDropDown.toggle()
//                    }
                XButton(selectedOptions, type: .filled, action: {
                    self.showDropDown.toggle()
                })
                Spacer()
            }
            VStack {
                if self.showDropDown {
                    XDropDown(
                        text: $selectedOptions,
                        isShowDropDown: $showDropDown,
                        options: [
                            "홈",
                            "일정",
                            "피드",
                            "신청",
                            "전체"
                        ])
                }
            }
        }
        .animation(.easeInOut(duration: 0.3))
    }
}

struct DropDownPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownPlaygroundView()
    }
}
