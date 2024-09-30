// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LinkedList",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LinkedList",
            targets: ["LinkedList"]),
    ],
    targets: [
        .target(
            name: "LinkedList"),
        .testTarget(
            name: "LinkedListTests",
            dependencies: ["LinkedList"]),
    ]
)
