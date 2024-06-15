// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuroraEditorSourceEditor",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "AuroraEditorSourceEditor",
            targets: ["AuroraEditorSourceEditor"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/AuroraEditor/AuroraEditorTextView.git",
			branch: "main"
        ),
        .package(
            url: "https://github.com/AuroraEditor/AuroraEditorLanguage.git",
			branch: "main"
        ),
        .package(
            url: "https://github.com/ChimeHQ/TextFormation",
            from: "0.8.2"
        )
    ],
    targets: [
        .target(
            name: "AuroraEditorSourceEditor",
            dependencies: [
                "AuroraEditorTextView",
                "AuroraEditorLanguage",
                "TextFormation",
            ]
        ),
        .testTarget(
            name: "AuroraEditorSourceEditorTests",
            dependencies: [
                "AuroraEditorSourceEditor",
                "AuroraEditorLanguage",
            ]
        ),
    ]
)
