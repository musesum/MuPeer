// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
