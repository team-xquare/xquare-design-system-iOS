import SwiftUI

struct BottomSheetPlaygrondView: View {
    @State var isPresented: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isPresented = true
                } label: {
                    Text("Test BottomSheet")
                }
                .xBottomSheet(isPresented: $isPresented, isIndicator: true, style: .half) {
                    Color
                        .black
                }
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
