import Foundation
import SwiftUI

public struct NotoSansKR {
     public static func registerFonts() {
        XFontWeight.allCases.forEach {
            registerFont(bundle: .module, fontName: "NotoSansKR-\($0.rawValue)", fontExtension: "otf")
        }
     }

    private static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
                  fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
