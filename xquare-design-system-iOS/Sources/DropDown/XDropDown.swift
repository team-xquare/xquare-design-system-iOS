import SwiftUI

public struct XDropDown: View {
    @Binding var text: String
    @Binding var isShowDropDown: Bool
    var options: [String]
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 8) {
                ForEach(options, id: \.self) { option in
                    DropDownCell(
                        option: option,
                        isShowDropDown: $isShowDropDown,
                        optionSelectedAction: $text
                    )
                }
            }
            .padding(.vertical, 12)
            .background(Color.Neutral.surface)
            .cornerRadius(10)
        }
        .frame(height: CGFloat(options.count) * 30)
        .cornerRadius(10)
        .padding(.top, 50)
    }
}



struct XDropDown_Previews: PreviewProvider {
    @State var selectedText: String
    static var previews: some View {
        VStack {
            XDropDown(
                text: .constant("sdf"),
                isShowDropDown: .constant(true),
                options:
                    [
                        "Menu 1",
                        "Menu 2",
                        "Menu 3",
                        "Menu 4"
                    ]
            )
        }
    }
}
