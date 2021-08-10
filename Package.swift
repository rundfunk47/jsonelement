// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "JSONElement",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v7)],
    products: [
        .library(
            name: "JSONElement",
            targets: ["JSONElement"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JSONElement",
            dependencies: [],
            path: "JSONElement",
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "JSONElementTests",
            dependencies: ["JSONElement"],
            path: "JSONElementTests"
        )
    ]
)
