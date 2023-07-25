import Foundation
import SwiftUI

public enum ColorType: String {
    case primary = "Primary"
    case secondary = "Secondary"
    case tertiary = "Tertiary"
    case error = "Error"
    case neutral = "Neutral"
    case neutralVariant = "Neutral Variant"
}

extension Color {
    init(type: ColorType, _ palette: Int) {
        self.init("\(type.rawValue) \(palette)", bundle: Bundle.module)
    }
    
    public func darkModeColor(_ dark: Color) -> Color {
        let color = UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            return UITraitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(self)
        }
        return Color(uiColor: color)
    }
}
