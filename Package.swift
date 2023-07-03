// swift-tools-version: 5.8

import PackageDescription

let package = Package(
        name: "bbedit-swift-tools",
        platforms: [
            .macOS("12.0"),
        ],
        products: [
            .library(name:"bbedit-swift-tools", targets: ["bbedit-swift-tools"]),
            .executable(name: "url-enc", targets: ["url-enc"]),
            .executable(name: "url-dec", targets: ["url-dec"]),
            .executable(name: "base64-enc", targets: ["base64-enc"]),
            .executable(name: "base64-dec", targets: ["base64-dec"]),
            .executable(name: "tidy", targets: ["tidy"]),
            .executable(name: "url-explode", targets: ["url-explode"]),
            .executable(name: "url-json-unescape", targets: ["url-json-unescape"]),
            .executable(name: "tabulate", targets: ["tabulate"])
        ],
        dependencies: [
            .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.8.0")
        ],
        targets: [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .executableTarget(
                    name: "url-enc",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/url-enc"),
            .executableTarget(
                    name: "url-dec",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/url-dec"),
            .executableTarget(
                    name: "base64-enc",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/base64-enc"),
            .executableTarget(
                    name: "base64-dec",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/base64-dec"),
            .executableTarget(
                    name: "tidy",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/tidy"),
            .executableTarget(
                    name: "url-explode",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/url-explode"),
            .executableTarget(
                    name: "url-json-unescape",
                    dependencies: ["bbedit-swift-tools"],
                    path: "Sources/url-json-unescape"),
            .executableTarget(
                    name: "tabulate",
                    dependencies: ["bbedit-swift-tools", "SwiftCSV"],
                    path: "Sources/tabulate"),
            .target(name: "bbedit-swift-tools", path: "Sources/common")
        ]

)