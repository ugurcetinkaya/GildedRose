import XCTest
@testable import GildedRose

final class GildedRoseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GildedRose().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
