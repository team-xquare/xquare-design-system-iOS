import SwiftUI

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
