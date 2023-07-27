import SwiftUI

struct FontPlaygroundView: View {
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
                    Section {
                        Text(proto.0)
                            .xFont(.title(.large))
                    }

                    VStack(alignment: .leading) {
                        ForEach(proto.1, id: \.hashValue) { item in
                            Text("SampleText")
                                .xFont(item)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FontPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        FontPlaygroundView()
    }
}
