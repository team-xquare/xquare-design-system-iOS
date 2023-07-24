import SwiftUI
import UIKit

public extension View {
    func xCorner(type: CornerType) -> some View {
        ModifiedContent(content: self, modifier: XCorner(type: type))
    }
}

struct XCorner: ViewModifier {
    var type: CornerType
    init(type: CornerType) {
        self.type = type
    }

    func body(content: Content) -> some View {
        content
            .cornerRadius(type.rawValue)
    }

}
