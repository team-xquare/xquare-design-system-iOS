import SwiftUI

public struct XSwitch: View {
    @Binding var isOn: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .toggleStyle(.switch)
            .tint(isOn ? .Secondary.secondary : .NeutralVariant.outline)
    }
}

struct XSwitch_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            XSwitch(isOn: .constant(true))
            XSwitch(isOn: .constant(false))
        }
    }
}
