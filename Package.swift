//swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "ICTMDBViewKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v26)],
    products: [.library(name: "ICTMDBViewKit", type: .dynamic, targets: ["ICTMDBViewKit"])],
    dependencies: [
         
           .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.6.1")
       ],
    targets: [
        .target(
            name: "ICTMDBViewKit",
            dependencies: [
                            "Kingfisher"
                        ],
            path: "ICTMDBViewKit",
            resources: [.process("Resources")]
        ),
    ]
)
