import SwiftUI

public struct XDivider: View {

    public var body: some View {
        Divider()
            .background(Color.NeutralVariant.outlineVariant)
    }
}

struct XDivider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            XDivider()
        }
    }
}
