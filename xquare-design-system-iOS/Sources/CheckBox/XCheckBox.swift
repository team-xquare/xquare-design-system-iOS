import SwiftUI

public struct XCheckBox: View {
    @Binding var state: CheckBoxState
    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(state: Binding<CheckBoxState>) {
        _state = state
    }

    public var body: some View {
        HStack {
            Image(systemName: state.rawValue)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(state.foregroundColor())
                .opacity(isEnabled ? 1.0 : 0.4)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.1)) {
                        state.toggle()
                    }
                }
        }
    }
}

struct XCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        XCheckBox(state: .constant(.selected))
            .padding()
    }
}
