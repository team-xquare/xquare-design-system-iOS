import SwiftUI

struct XBottomSheet<Content: View>: View {
    @Binding var isOpen: Bool
    
    let isIndicator: Bool
    let maxHeight: CGFloat
    let content: () -> Content
    
    @GestureState private var translation: CGFloat = 0
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight * 0.7
    }

    public init(
        isOpen: Binding<Bool>,
        isIndicator: Bool,
        style: XBottomSheetStyle,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isIndicator = isIndicator
        self.content = content
        self._isOpen = isOpen
        
        self.maxHeight = {
            switch style {
            case .full:
                return UIScreen.main.bounds.height * 0.6
            case .half:
                return UIScreen.main.bounds.height * 0.3
            }
        }()
    }
    var body: some View {
        ZStack {
            Spacer()
                .xBlur(style: .low)
                .onTapGesture {
                    isOpen = false
                }
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        if isIndicator {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.NeutralVariant.outline)
                                .frame(width: 32, height: 4)
                                .padding(.vertical, 12)
                                .onTapGesture {
                                    self.isOpen.toggle()
                                }
                        }

                        content().padding(.top, isIndicator ? 0 : 16)

                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: self.maxHeight, alignment: .bottom)
                    .background(Color.Neutral.background)
                    .xCorner(.large)
                    .offset(y: max(self.offset + self.translation, 0))
                    .animation(.interactiveSpring(), value: isOpen)
                    .gesture(
                        DragGesture()
                            .updating(self.$translation) { value, state, _ in
                                state = value.translation.height
                            }.onEnded { value in
                                let snapDistance = self.maxHeight * 0.25
                                guard abs(value.translation.height) > snapDistance else {
                                    return
                                }
                                self.isOpen = value.translation.height < 0
                            }
                    )
                }
                .xShadow(style: .medium)
            }
            VStack {
                Spacer()
                Color.white
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(height: CGFloat(10))
            }
        }
        .background(Background())
    }
}

public extension View {
    func xBottomSheet<Content: View>(isPresented: Binding<Bool>, isIndicator: Bool = false, style: XBottomSheetStyle, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .fullScreenCover(isPresented: isPresented) {
                XBottomSheet(isOpen: isPresented, isIndicator: isIndicator, style: style) {
                    content()
                }
        }
    }
}
