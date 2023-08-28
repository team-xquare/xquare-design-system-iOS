import SwiftUI

public struct DropDownCell: View {
    var option: String
    @Binding var isShowDropDown: Bool
    @Binding var optionSelectedAction: String

    public var body: some View {
        Button {
            optionSelectedAction = option
            isShowDropDown = false
        } label: {
            HStack {
                Spacer()
                    .frame(width: 16)
                Text(option)
                    .xFont(.label(.medium), weight: .regular, color: .black)
                Spacer()
                    .frame(width: 16)
            }
            .frame(height: 16)
        }
    }
}
