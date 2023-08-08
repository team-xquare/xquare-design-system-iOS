import SwiftUI

struct BottomSheetPlaygrondView: View {
    @State var isPresented: Bool = false
    @State var isIndicator: Bool = false
    @State var style: XBottomSheetStyle = .half
    @State var currentStyle: String = "half"
    var body: some View {
        NavigationView {
            VStack {
                Toggle(
                    isOn: $isIndicator,
                    label: {
                        Label("isIndicator", systemImage: "xmark")
                    }
                )
                Text("현재 스타일 \(currentStyle)")
                HStack {
                    Button {
                        style = .full
                        currentStyle = "full"
                    } label: {
                        Text("full")
                    }
                    Button {
                        style = .half
                        currentStyle = "half"
                    } label: {
                        Text("half")
                    }
                }
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Text("Test BottomSheet")
                }
                .xBottomSheet(isPresented: $isPresented, isIndicator: isIndicator, style: style) {
                    Color
                        .black
                }
                Spacer()
            }
            
            .navigationTitle("바텀시트")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BottomSheetPlaygrondView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetPlaygrondView()
    }
}
