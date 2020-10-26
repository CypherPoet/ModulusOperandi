import Foundation
import XCTest
import ModulusOperandi


final class BinaryFloatingPointModuloTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
}



// MARK: - Positive Divisor Tests
extension BinaryFloatingPointModuloTests {

    func test_BinaryFloatingPointModulo_GivenPositiveDivisor_PerformsModulusAccordingToMode() throws {
        let divisor: Double = 4.0

        var dividend: Double = -4.0

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0.0)


        dividend = -3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1.0)


        dividend = -2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2.0)


        dividend = -1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3.0)


        dividend = 0

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0.0)


        dividend = 1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1.0)


        dividend = 2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2.0)


        dividend = 3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3.0)


        dividend = 4

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0.0)
    }
}


// MARK: - Negative Divisor Tests
extension BinaryFloatingPointModuloTests {

    func test_BinaryFloatingPoint_GivenPositiveDivisor_PerformsModulusAccordingToMode() throws {
        let divisor: Double = -4.0

        var dividend: Double = -4.0

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0.0)


        dividend = -3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1.0)


        dividend = -2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2.0)


        dividend = -1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), -1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3.0)


        dividend = 0

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0.0)


        dividend = 1

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 1.0)


        dividend = 2

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -2.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 2.0)


        dividend = 3

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 3.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), -1.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 3.0)


        dividend = 4

        XCTAssertEqual(dividend.modulo(divisor, mode: .truncating), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .flooring), 0.0)
        XCTAssertEqual(dividend.modulo(divisor, mode: .euclidean), 0.0)
    }
}



// MARK: - Default Mode
extension BinaryFloatingPointModuloTests {

    func test_BinaryFloatingPoint_defaultsToEuclideanMode() throws {
        let dividend: Double = -3.0
        let divisor: Double = 5.0

        XCTAssertEqual(dividend.modulo(divisor), 2.0)
    }
}


// MARK: - Types
extension BinaryIntegerModuloTests {

    func test_types_performsModuloOnCGFloatTypes() throws {
        let dividend: CGFloat = -3.0
        let divisor: CGFloat = 5

        XCTAssertEqual(dividend.modulo(divisor), 2)
    }
}
