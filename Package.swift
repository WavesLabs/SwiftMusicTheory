// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftMusicTheory",
  products: [
    .library(
      name: "SwiftMusicTheory",
      targets: ["SwiftMusicTheory"]
    ),
  ],
  targets: [
    .target(
      name: "SwiftMusicTheory"
    ),
    .testTarget(
      name: "SwiftMusicTheoryTests",
      dependencies: ["SwiftMusicTheory"]
    ),
  ]
)
