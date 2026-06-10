import UIKit

extension UIApplication {
  // `nonisolated` is required: under Swift 6 strict concurrency this
  // accessor inherits `@MainActor` from `UIApplication`, and an isolation
  // check inside `compactMap`'s closure traps with `SIGTRAP` when
  // called from a background queue. Reading `Bundle.main.infoDictionary`
  // is safe off the main thread.
  public nonisolated static var semanticVersion: SemanticVersion {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as! String
    let build = dictionary["CFBundleVersion"] as! String
    let hash = dictionary["GIT_COMMIT_HASH"] as! String

    let values = version.split(separator: ".").compactMap { Int($0) }

    return SemanticVersion(
      major: values[0],
      minor: values[1],
      patch: values[2],
      build: build,
      hash: hash
    )
  }
}
