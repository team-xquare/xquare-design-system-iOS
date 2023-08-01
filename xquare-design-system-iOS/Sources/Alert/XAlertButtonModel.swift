import Foundation

public struct XAlertButtonModel {
    var text: String
    var action: () -> ()

    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
}
