// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MuPeer",
    platforms: [.iOS(.v17)],
    products: [.library(name: "MuPeer", targets: ["MuPeer"])],
    dependencies: [

    ],
    targets: [
        .target(
            name: "MuPeer",
            dependencies: [
               
            ]),
        .testTarget(
            name: "MuPeerTests",
            dependencies: ["MuPeer"]),
    ]
)
