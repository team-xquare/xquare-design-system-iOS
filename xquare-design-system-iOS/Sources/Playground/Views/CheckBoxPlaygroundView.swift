import SwiftUI

struct CheckboxPlaygroundView: View {
    @State var state = XCheckBox.CheckBoxState.selected
    var body: some View {
        ScrollView {
            VStack {
                XCheckBox(state: $state)
                XCheckBox(state: $state)
                    .disabled(true)
            }
        }
    }
}

struct CheckboxPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxPlaygroundView()
    }
}
