import XCTest

@testable import DemoTarget

final class DemoTests: XCTestCase {

    func testDemo() {
        // GIVEN
        let input: Int = 1

        // WHEN
        let output: Demo = .init(value: input)

        // THEN
        XCTAssertEqual(output.value, input)
    }
}
