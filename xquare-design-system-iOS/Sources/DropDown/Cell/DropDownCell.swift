import SwiftUI

public struct DropDownCell: View {
    @Binding var isSelected: Bool
    var option: String
    var optionSelectedAction: ((_ option: String) -> Void)?

    public var body: some View {
        Button {
            if let optionSelectedAction = self.optionSelectedAction {
                optionSelectedAction(self.option)
            }
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
