import Foundation

public struct SemanticVersion {
  public init(
    major: Int,
    minor: Int,
    patch: Int,
    build: String,
    hash: String
  ) {
    self.major = major
    self.minor = minor
    self.patch = patch
    self.build = build
    self.hash = hash
  }

  public init(string: String) {
    //    v1.7.3.2020.09.21.15.346856BFB
    let values = string.replacingOccurrences(of: "v", with: "")
      .split(separator: ".")

    major = Int(values[0])!
    minor = Int(values[1])!
    patch = Int(values[2])!
    build = String(values.dropFirst(3).joined(separator: ".").dropLast(7))
    hash = String(values.last!.suffix(7))
  }

  public let build: String

  public var displayHash: String {
    String(hash.prefix(7))
  }

  public var shortVersion: String {
    "\(major).\(minor).\(patch)"
  }

  /// Machine-readable, without a separator before the hash; `init(string:)` parses it back.
  public var versionString: String {
    "v\(shortVersion).\(build)\(displayHash)"
  }

  /// For showing to users, e.g. `v1.0.0.2026.10.20.10.26 (F5062EF)`.
  public var displayVersionString: String {
    "v\(shortVersion).\(build) (\(displayHash))"
  }

  private let major: Int
  private let minor: Int
  private let patch: Int
  private let hash: String
}

extension SemanticVersion: Comparable {
  public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    guard lhs.major == rhs.major else {
      return lhs.major < rhs.major
    }

    guard lhs.minor == rhs.minor else {
      return lhs.minor < rhs.minor
    }

    guard lhs.patch == rhs.patch else {
      return lhs.patch < rhs.patch
    }

    return lhs.build < rhs.build
  }
}

extension String {
  fileprivate static let empty = ""
}
