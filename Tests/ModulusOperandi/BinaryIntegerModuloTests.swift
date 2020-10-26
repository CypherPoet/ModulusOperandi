import Foundation
import XCTest
import ModulusOperandi


final class BinaryIntegerModuloTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}



// MARK: - Positive Divisor Tests
extension BinaryIntegerModuloTests {

    func test_BinaryIntegerModulo_GivenPositiveDivisor_PerformsModulusAccordingToMode() throws {
        let divisor: Int = 4

        var dividend: Int = -4

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0)


        dividend = -3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1)


        dividend = -2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2)


        dividend = -1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3)


        dividend = 0

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0)


        dividend = 1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1)


        dividend = 2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2)


        dividend = 3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3)


        dividend = 4

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0)
    }
}


// MARK: - Negative Divisor Tests
extension BinaryIntegerModuloTests {

    func test_BinaryFloatingPoint_GivenPositiveDivisor_PerformsModulusAccordingToMode() throws {
        let divisor: Int = -4

        var dividend: Int = -4

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0)


        dividend = -3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1)


        dividend = -2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2)


        dividend = -1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3)


        dividend = 0

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0)


        dividend = 1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1)


        dividend = 2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -2)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2)


        dividend = 3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 3)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -1)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3)


        dividend = 4

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0)
    }
}


// MARK: - Default Mode
extension BinaryIntegerModuloTests {

    func test_BinaryInteger_defaultsToEuclideanMode() throws {
        let dividend: Int = -3
        let divisor: Int = 5

        XCTAssertEqual(dividend.modulo(divisor), 2)
    }
}
