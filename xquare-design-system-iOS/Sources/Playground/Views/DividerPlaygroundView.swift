import SwiftUI

struct DividerPlaygroundView: View {
    var body: some View {
        VStack {
            Spacer()
            XDivider()
            XDivider()
            Spacer()
        }
    }
}

struct DividerPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        DividerPlaygroundView()
    }
}
