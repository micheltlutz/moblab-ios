// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SettingsScene",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SettingsScene",
            targets: ["SettingsScene"]),
    ],
    dependencies: [
        .package(path: "ProjectCore"),
    ],
    targets: [
        .target(
            name: "SettingsScene",
            dependencies: ["ProjectCore"]),
        .testTarget(
            name: "SettingsSceneTests",
            dependencies: ["SettingsScene"]),
    ]
)
