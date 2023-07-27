import SwiftUI

struct ColorPlaygroundView: View {
    let colors: [(String, [Color])] = [
        ("Primary", [
            .Primary.primary,
            .Primary.onPrimary,
            .Primary.primaryContainer,
            .Primary.onPrimaryContainer
        ]),
        ("Secondary", [
            .Secondary.secondary,
            .Secondary.onSecondary,
            .Secondary.secondaryContainer,
            .Secondary.onSecondaryContainer
        ]),
        ("Tertiary", [
            .Tertiary.tertiary,
            .Tertiary.onTertiary,
            .Tertiary.tertiaryContainer,
            .Tertiary.onTertiaryContainer
        ]),
        ("Error", [
            .Error.error,
            .Error.onError,
            .Error.errorContainer,
            .Error.onErrorContainer
        ]),
        ("Neutral", [
            .Neutral.background,
            .Neutral.onBackground,
            .Neutral.surface,
            .Neutral.onSurface
        ]),
        ("Neutral Variant", [
            .NeutralVariant.surfaceVariant,
            .NeutralVariant.onSurfaceVariant,
            .NeutralVariant.outline,
            .NeutralVariant.outlineVariant
        ])
    ]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 10)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(colors, id: \.0) { subColors in
                    Text(subColors.0)
                    Divider()
                    HStack {
                        ForEach(subColors.1, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(color)
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct ColorPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPlaygroundView()
    }
}
