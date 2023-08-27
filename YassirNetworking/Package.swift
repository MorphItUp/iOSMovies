// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YassirNetworking",
    products: [
        .library(
            name: "YassirNetworking",
            targets: ["YassirNetworking"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "YassirNetworking",
            dependencies: []),
        .testTarget(
            name: "YassirNetworkingTests",
            dependencies: ["YassirNetworking"]),
    ]
)
