// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "SemanticVersion",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "SemanticVersion",
      targets: ["SemanticVersion"]
    )
  ],
  targets: [
    .target(
      name: "SemanticVersion"
    ),
    .testTarget(
      name: "SemanticVersionTests",
      dependencies: ["SemanticVersion"]
    ),
  ]
)
