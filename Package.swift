// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationPangle",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationPangle", targets: ["Yodo1MasMediationPangleTarget"]),
        .library(name: "Yodo1MasMediationPangle-AppLovinMediationByteDanceAdapter", targets: ["Yodo1MasMediationPangle-AppLovinMediationByteDanceAdapterTarget"]),
        .library(name: "Yodo1MasMediationPangle-PangleAdapter", targets: ["Yodo1MasMediationPangle-PangleAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/bytedance/AdsGlobalPackage.git", exact: "8.3.0-release.8"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationPangle ====================
        .target(
            name: "Yodo1MasMediationPangleTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationPangle"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
            ],
            path: "Sources/Yodo1MasMediationPangleTarget",
            resources: [.copy("Yodo1MasPangle.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationPangle",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationPangle/Yodo1MasMediationPangle-5.0.0-beta.5.zip",
            checksum: "7e1862877633063fbf561ab1682d6c00305d791cbdbefd41f5c31d0a90adb12d"
        ),
        // ==================== Yodo1MasMediationPangle-AppLovinMediationByteDanceAdapter ====================
        .target(
            name: "Yodo1MasMediationPangle-AppLovinMediationByteDanceAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationPangleTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationByteDanceAdapter"),
            ],
            path: "Sources/Yodo1MasMediationPangle-AppLovinMediationByteDanceAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationByteDanceAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationPangle/AppLovinMediationByteDanceAdapter-5.0.0-beta.5.zip",
            checksum: "aa69f105de006222fbd54da8bc14f70a02af39ea81b4f45c0abff4c45fd67ac0"
        ),
        // ==================== Yodo1MasMediationPangle-PangleAdapter ====================
        .target(
            name: "Yodo1MasMediationPangle-PangleAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationPangleTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "PangleAdapter"),
            ],
            path: "Sources/Yodo1MasMediationPangle-PangleAdapterTarget"
        ),
        .binaryTarget(
            name: "PangleAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationPangle/PangleAdapter-5.0.0-beta.5.zip",
            checksum: "e015cc4319f932e6dd76dc702faf46b43d191ca4d3df61c985bba3c6a9102e15"
        ),
    ]
)
