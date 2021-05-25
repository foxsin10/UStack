// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "UStack",
    platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v11)],
    products: [
        .library(
            name: "UStack",
            targets: ["UStack"]),
    ],
    targets: [
        .target(
            name: "UStack",
            dependencies: []),
        .testTarget(
            name: "UStackTests",
            dependencies: ["UStack"]),
    ]
)
