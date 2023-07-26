import Foundation
import SwiftUI

public enum XTextfieldStyle {
    case `default`(isSecure: Bool = false)
    case iconOnPrefix(icon: Image, action: () -> Void)
    case iconOnSuffix(icon: Image, action: () -> Void)
    case iconOnPrefixAndSuffix(prefix: Image, suffix: Image, action: () -> Void)
    case supportText(isSecure: Bool = false)
}
