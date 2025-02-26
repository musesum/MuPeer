// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MuPeer",
    platforms: [.iOS(.v17)],
    products: [.library(name: "MuPeer", targets: ["MuPeer"])],
    dependencies: [
        .package(url: "https://github.com/musesum/MuFlo.git", branch: "dev"),
    ],
    targets: [
        .target(
            name: "MuPeer",
            dependencies: [
                .product(name: "MuFlo", package: "MuFlo"),
            ]),
        .testTarget(
            name: "MuPeerTests",
            dependencies: ["MuPeer"]),
    ]
)
