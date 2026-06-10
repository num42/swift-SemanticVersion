import UIKit

extension UIApplication {
  public static var semanticVersion: SemanticVersion {
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
