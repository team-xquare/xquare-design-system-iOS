import SwiftUI

public extension View {
    func xAlert(isPresented: Binding<Bool>, xAlert: @escaping () -> XAlert) -> some View {
        self.fullScreenCover(isPresented: isPresented) {
            xAlert()
        }
    }
}

public struct XAlert: View {
    public enum XAlertType {
        case double(button1: XAlertButtonModel, button2: XAlertButtonModel)
        case single(button: XAlertButtonModel)
    }

    @Environment(\.presentationMode) var presentationMode
    @State private var animate = false

    var title: String
    var content: String
    var type: XAlertType

    public init(
        title: String,
        content: String = "",
        type: XAlertType
    ) {
        self.title = title
        self.content = content
        self.type = type
    }

    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            VStack(spacing: 6) {
                Group {
                    Text(title)
                        .xFont(.title(.large), weight: .bold)
                    
                    Text(content)
                        .xFont(.body(.medium), weight: .bold)
                }
                .multilineTextAlignment(.leading)
            }
            
            HStack(spacing: 10) {
                Spacer()
                
                switch type {
                case let .double(button1, button2):
                    XButton(button1.text, icon: nil) {
                        button1.action()
                        self.dismissAlert()
                    }
                    XButton(button2.text, icon: nil) {
                        button2.action()
                        self.dismissAlert()
                    }
                case .single(let button):
                    XButton(button.text, icon: nil) {
                        button.action()
                        self.dismissAlert()
                    }
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.Neutral.surface)
        .cornerRadius(12)
        .xShadow(style: .medium)
        .padding(.horizontal,16)
        .xBlur(style: .low)
        .onAppear {
            withAnimation(.default.speed(0.4)) {
                animate = true
            }
        }
    }

    private func dismissAlert() {
        animate = false
        self.presentationMode.wrappedValue.dismiss()
    }

}

struct SDAlert_Preview: PreviewProvider {
    static var previews: some View {
        VStack {}
            .xAlert(isPresented: .constant(true)) {
                XAlert(
                    title: "title",
                    content: "content",
                    type: .single(
                        button: .init(text: "button") {
                            
                        }
                    )
                )
            }
            .xAlert(isPresented: .constant(false)) {
                XAlert(
                    title: "title",
                    content: "content",
                    type: .double(
                        button1: .init(text: "button1") {
                            
                        },
                        button2: .init(text: "button1") {
                            
                        }
                    )
                )
            }
    }
}
