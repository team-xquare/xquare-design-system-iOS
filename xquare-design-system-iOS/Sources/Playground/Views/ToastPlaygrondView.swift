import SwiftUI

struct ToastPlaygroundView: View {
    @State var isShowToast = false

    var body: some View {
        VStack(spacing: 16) {
            Button {
                isShowToast.toggle()
            } label: {
                Text("Toast Show!")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .xToast(
            isShowing: $isShowToast,
            message: "좋아요. 아주 좋아요. 오류가 나지 않았습니다.",
            icon: .filledCalendar
        )
    }
}

struct ToastPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ToastPlaygroundView()
    }
}
