internal import Testing

@testable internal import SemanticVersion

final class SemanticVersionTests {
  @Test("Should parse semantic version string correctly")
  func testExample() throws {
    #expect(
      SemanticVersion(string: "v1.7.3.2020.09.21.15.346856BFB")
        == SemanticVersion(major: 1, minor: 7, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
    )

    #expect(
      SemanticVersion(major: 1, minor: 7, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
        < SemanticVersion(major: 2, minor: 7, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
    )

    #expect(
      SemanticVersion(major: 1, minor: 7, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
        < SemanticVersion(major: 1, minor: 8, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
    )

    #expect(
      SemanticVersion(major: 1, minor: 7, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
        < SemanticVersion(major: 1, minor: 7, patch: 4, build: "2020.09.21.15.34", hash: "6856BFB")
    )

    #expect(
      SemanticVersion(major: 1, minor: 7, patch: 3, build: "2020.09.21.15.34", hash: "6856BFB")
        < SemanticVersion(major: 1, minor: 7, patch: 3, build: "2020.09.21.15.35", hash: "6856BFB")
    )

    #expect(
      SemanticVersion(major: 4, minor: 4, patch: 4, build: "2020.09.21.15.34", hash: "6856BFB")
        < SemanticVersion(major: 5, minor: 3, patch: 4, build: "2020.09.21.15.34", hash: "6856BFB")
    )
  }

  @Test("Separates build number and commit hash in the display string")
  func displayVersionString() {
    let version = SemanticVersion(
      major: 1,
      minor: 0,
      patch: 0,
      build: "2026.10.20.10.26",
      hash: "F5062EF2"
    )

    #expect(version.displayVersionString == "v1.0.0.2026.10.20.10.26 (F5062EF)")
  }
}
