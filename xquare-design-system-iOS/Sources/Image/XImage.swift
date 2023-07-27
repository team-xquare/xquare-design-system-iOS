import SwiftUI

public struct XImage: View {
    public enum Image: String {
        case arrowDown = "Arrow Down"
        case arrowLeft = "Arrow Left"
        case arrowRight = "Arrow Right"
        case arrowUp = "Arrow Up"
        case filledCalendar = "Filled Calendar"
        case filledComment = "Filled Comment"
        case filledDashboard = "Filled Dashboard"
        case filledDropdown = "Filled Dropdown"
        case filledEye = "Filled Eye"
        case filledFeed = "Filled Feed"
        case filledGear = "Filled Gear"
        case filledHeart = "Filled Heart"
        case filledHome = "Filled Home"
        case filledMenu = "Filled Menu"
        case outlinedCalendar = "Outlined Calendar"
        case outlinedChecklistLeft = "Outlined Checklist Left"
        case outlinedChecklistRight = "Outlined Checklist Right"
        case outlinedDashboard = "Outlined Dashboard"
        case outlinedEye = "Outlined Eye"
        case outlinedFeed = "Outlined Feed"
        case outlinedHeart = "Outlined Heart"
        case outlinedHome = "Outlined Home"
    }
    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        xImageToImage()
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: 24, height: 24)
    }

    private func xImageToImage() -> SwiftUI.Image {
        SwiftUI.Image(image.rawValue, bundle: Bundle.module)
    }
}
