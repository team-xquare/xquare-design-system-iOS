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

extension Color {
    init(type: ColorType, _ palette: Int) {
        self.init("\(type) \(palette)", bundle: Bundle.module)
    }
}
