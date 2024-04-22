// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoginScene",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "LoginScene",
            targets: ["LoginScene"]),
    ],
    targets: [
        .target(
            name: "LoginScene"),
        .testTarget(
            name: "LoginSceneTests",
            dependencies: ["LoginScene"]),
    ]
)
