import SwiftUI

struct SwitchPlaygroundView: View {
    @State var isOn = true
    var body: some View {
        ScrollView {
            VStack {
                XSwitch(isOn: $isOn)

                XSwitch(isOn: $isOn)
                    .disabled(true)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

struct SwitchPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchPlaygroundView()
    }
}
