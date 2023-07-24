import Foundation
import SwiftUI

public enum ColorType: String {
    case primary = "Primary"
    case secondary = "Secondary"
    case tertiary = "Tertiary"
    case error = "Error"
    case netural = "Netural"
    case neutralVariant = "Neutral Variant"
}

public enum ColorState {
    case base
    case on
    case container
    case onContainer

    func colorState(_ type: ColorType) -> String {
        switch self {
        case .base:
            return type.rawValue
        case .on:
            return "on \(type.rawValue)"
        case .container:
            return "\(type.rawValue) Container"
        case .onContainer:
            return "On \(type.rawValue) Container"
        }
    }
}

extension Color {
    init(type: ColorType, _ state: ColorState) {
        self.init(state.colorState(type), bundle: Bundle.module)
    }
}
