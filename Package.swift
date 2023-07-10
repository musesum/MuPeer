// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "MuPeer",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MuPeer",
            targets: ["MuPeer"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "MuPeer",
            dependencies: []),
        .testTarget(
            name: "MuPeerTests",
            dependencies: ["MuPeer"]),
    ]
)
