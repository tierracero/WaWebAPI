// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Conveniences
struct Dep {
    let package: PackageDescription.Package.Dependency
    let targets: [Target.Dependency]
}

extension Array where Element == Dep {
    
    mutating func appendLocal(_ path: String, targets: Target.Dependency...) {
        append(.init(package: .package(path: "~/Development/Packages/\(path)"), targets: targets))
    }
    
    mutating func append(_ url: String, from: Version, targets: Target.Dependency...) {
        append(.init(package: .package(url: url, from: from), targets: targets))
    }
    
    mutating func appendFromMaster(_ url: String, targets: Target.Dependency...) {
        append(
            .init(
                package: .package(url: url, branch: "main"),
                targets: targets
            )
        )
    }
    
    mutating func append(_ url: String, exact: Version, targets: Target.Dependency...) {
        append(
            .init(
                package: .package(url: url, exact: exact),
                targets: targets
            ))
    }
    
}

var deps: [Dep] = []

deps.appendFromMaster("git@github.com:tierracero/TCFoundation.git",
                             targets: .product(name: "TCFoundation", package: "TCFoundation"))

deps.append("https://github.com/vapor/vapor.git", from: "4.0.0",
            targets: .product(name: "Vapor", package: "vapor"))

deps.append("https://github.com/SwifQL/VaporBridges.git", from: "1.0.0-rc",
                targets: .product(name: "VaporBridges", package: "VaporBridges"))

deps.append("https://github.com/tierracero/PostgresBridge.git", from: "1.0.0-rc",
                targets: .product(name: "PostgresBridge", package: "PostgresBridge"))

deps.append("https://github.com/SwifQL/SwifQL.git", from: "2.0.0-beta.3.21.0",
                targets: .product(name: "SwifQL", package: "SwifQL"))

let package = Package(
    name: "WaWebAPI",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WaWebAPI",
            targets: ["WaWebAPI"]),
    ],
    dependencies: deps.map{ $0.package },
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "WaWebAPI",
            dependencies: deps.flatMap { $0.targets }
        ),
        .testTarget(
            name: "WaWebAPITests",
            dependencies: ["WaWebAPI"]),
    ]
)
