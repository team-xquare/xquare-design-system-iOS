import SwiftUI

struct DropDownPlaygroundView: View {
    @State var showDropDown: Bool = false
    @State var selectedOptions: String = "홈"
    var optionsSelectedActions: ((_ options: String) -> Void)?

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                XButton(selectedOptions, type: .filled, action: {
                    self.showDropDown.toggle()
                })
                Spacer()
            }
            VStack {
                if self.showDropDown {
                    XDropDown(
                        text: $selectedOptions,
                        options: [
                            "홈",
                            "일정",
                            "피드",
                            "신청",
                            "전체"
                        ]) { option in
                            self.showDropDown = false
                            self.selectedOptions = option
                            self.optionsSelectedActions?(option)
                        }
                }
            }
            .padding(.top, 50)
        }
    }
}

struct DropDownPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownPlaygroundView()
    }
}
