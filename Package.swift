// swift-tools-version:5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "MacrosKit",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "MacrosKit",
            targets: ["MacrosKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.2")
    ],
    targets: [
        .target(
            name: "MacrosKit",
            dependencies: ["MacrosKitCompilerPlugin"],
            path: "MacrosKit"
        ),
        .macro(
            name: "MacrosKitCompilerPlugin",
            dependencies: [
              .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
              .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "MacrosKitCompilerPlugin"
        ),
    ]
)
