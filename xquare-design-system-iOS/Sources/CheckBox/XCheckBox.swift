import SwiftUI

public struct XCheckBox: View {
    public enum CheckBoxState: String {
        case selected = "checkmark.square.fill"
        case indeterminate = "minus.square.fill"
        case unselected = "rectangle"
        
        func foregroundColor() -> Color {
            switch self {
            case .selected, .indeterminate: return .Secondary.secondary
            case .unselected: return .Secondary.onSecondaryContainer
            }
        }
        
        mutating func toggle() {
            switch self {
            case .selected: self = .indeterminate
            case .indeterminate: self = .unselected
            case .unselected: self = .selected
            }
        }
    }

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
