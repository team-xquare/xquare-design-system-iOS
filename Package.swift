// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xquare-design-system-iOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "xquare-design-system-iOS",
            targets: ["xquare-design-system-iOS"]),
    ],
    targets: [
        .target(
            name: "xquare-design-system-iOS",
            path: "xquare-design-system-iOS",
            resources: [.process("Resources")]
        )
    ]
)
