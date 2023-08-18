import SwiftUI

public struct XDropDown: View {
    @Binding var text: String
    var options: [String]
    var optionSelectedAction: ((_ option: String) -> Void)?

    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 8) {
                ForEach(options, id: \.self) { option in
                    DropDownCell(
                        isSelected: .constant(text == option),
                        option: option,
                        optionSelectedAction: optionSelectedAction
                    )
                }
            }
            .padding(.vertical, 12)
            .background(Color.Neutral.surface)
            .cornerRadius(10)
        }
        .frame(height: CGFloat(options.count) * 30)
        .cornerRadius(10)
    }
}



struct XDropDown_Previews: PreviewProvider {
    @State var selectedText: String
    static var previews: some View {
        VStack {
            XDropDown(
                text: .constant("sdf"),
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
