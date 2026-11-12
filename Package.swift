// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

// MARK: - Conveniences
struct Dep {
    let package: PackageDescription.Package.Dependency
    let targets: [Target.Dependency]
}

extension Array where Element == Dep {
    
    mutating func appendLocal(_ path: String, targets: Target.Dependency...) {
        let packagePath = URL(fileURLWithPath: NSHomeDirectory())
            .appendingPathComponent("Development/Packages/\(path)").path
        append(.init(package: .package(path: packagePath), targets: targets))
    }
    
    mutating func append(_ url: String, from: Version, targets: Target.Dependency...) {
        append(.init(package: .package(url: url, from: from), targets: targets))
    }
    
    mutating func appendFromMain(_ url: String, targets: Target.Dependency...) {
        append(
            .init(
                package: .package(url: url, branch: "main"),
                targets: targets
            )
        )
    }
    
    mutating func appendFromMaster(_ url: String, targets: Target.Dependency...) {
        append(
            .init(
                package: .package(url: url, branch: "master"),
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

if ProcessInfo.processInfo.environment["LIBS_DEVELOPMENT"] == "1" {
    deps.appendLocal("WaWebAPICore",
                     targets: .product(name: "WaWebAPICore", package: "WaWebAPICore"))
    deps.appendLocal("TCFoundation",
                     targets: .product(name: "TCFoundation", package: "TCFoundation"))
    deps.appendLocal("TCFundamentals",
                     targets: .product(name: "TCFundamentals", package: "TCFundamentals"))
} else {
    deps.appendFromMain("git@github.com:tierracero/WaWebAPICore.git",
                        targets: .product(name: "WaWebAPICore", package: "WaWebAPICore"))
    deps.appendFromMain("git@github.com:tierracero/TCFoundation.git",
                        targets: .product(name: "TCFoundation", package: "TCFoundation"))
    deps.appendFromMain("git@github.com:tierracero/TCFundamentals.git",
                        targets: .product(name: "TCFundamentals", package: "TCFundamentals"))
}

deps.append("https://github.com/vapor/vapor.git", from: "4.0.0",
            targets: .product(name: "Vapor", package: "vapor"))

deps.append("https://github.com/tierracero/PostgresBridge.git", from: "2.0.0",
            targets: .product(name: "PostgresBridge", package: "PostgresBridge", condition: .when(platforms: [.macOS,.linux])))

deps.append("https://github.com/tierracero/VaporBridges.git", from: "2.0.0",
            targets: .product(name: "VaporBridges", package: "VaporBridges", condition: .when(platforms: [.macOS,.linux])))

deps.append("https://github.com/swiftstream/SQL.git", from: "2.0.0",
                targets: .product(name: "SQL", package: "SQL"))


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
