import Foundation
import SwiftUI

public enum XTextfieldStyle {
    case `default`
    case secure
    case iconOnPrefix(icon: Image, action: () -> Void)
    case iconOnSuffix(icon: Image, action: () -> Void)
    case iconOnPrefixAndSuffix(prefix: Image, suffix: Image, action: () -> Void)
    case supportText(supportText: String)
}
