// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "wwdc23_remodel",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "wwdc23_remodel",
            targets: ["AppModule"],
            bundleIdentifier: "Copland.wwdc23-remodel",
            teamIdentifier: "MCC2B4P5MZ",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .location),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)