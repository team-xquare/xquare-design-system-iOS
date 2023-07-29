import SwiftUI

struct FontPlaygroundView: View {
    @State var fontWeight = XFontWeight.black
    let fonts: [(String, [XFontStyle])] = [
        ("Display", [
            .display(.large),
            .display(.medium),
            .display(.small)
        ]),
        ("Headline", [
            .headline(.large),
            .headline(.medium),
            .headline(.small)
        ]),
        ("Title", [
            .title(.large),
            .title(.medium),
            .title(.small)
        ]),
        ("Label", [
            .label(.large),
            .label(.medium),
            .label(.small)
        ]),
        ("Body", [
            .body(.large),
            .body(.medium),
            .body(.small)
        ])
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(fonts, id: \.0) { proto in
                    Text(proto.0)
                        .xFont(.title(.large))
                    
                    VStack(alignment: .leading) {
                        ForEach(proto.1, id: \.hashValue) { item in
                            Text("SampleText")
                                .xFont(item, weight: fontWeight)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .navigationBarItems(trailing: picker())
        }
    }

    @ViewBuilder
    func picker() -> some View {
        Menu {
            ForEach(XFontWeight.allCases, id: \.self) { weight in
                Button {
                    fontWeight = weight
                } label: {
                    HStack {
                        Text(weight.rawValue)
                            .xFont(.title(.large), weight: weight)
                    }
                }
            }
        } label: {
            HStack(spacing: 5) {
                Spacer()

                Text(fontWeight.rawValue)
                    .xFont(.title(.small), weight: fontWeight)

                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 16, height: 12)
            }
            .frame(width: 75)
        }
        .menuStyle(BorderlessButtonMenuStyle())
    }
}

struct FontPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        FontPlaygroundView()
    }
}
