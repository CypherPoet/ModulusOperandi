import Foundation
import ArgumentParser
import ModulusOperandi


struct ModulusOperandiCLI {

    @Argument(
        help: "The dividend to perform division against."
//        transform: parseDividend
    )
    var dividend: Double


    @Argument(
        help: """
        The divisor to use as a "modulus".
        """
//        transform: parseDividend
    )
    var divisor: Double


    @Flag(
        help: "The algorithm to use for computing results."
    )
    var mode: ModulusOperandi.ModulusMode = .euclidean
}


// MARK: - ParsableCommand
extension ModulusOperandiCLI: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "modulo",
        abstract: "Multifaceted modular arithmetic for Swift integers and floating-Point types",
        discussion: """
        """,
        version: "0.1.0",
        shouldDisplay: true,
        subcommands: []
    )

    func run() throws {
        print(dividend.modulo(divisor, mode: mode))
    }


    func validate() throws {
        if divisor == 0 {
            throw ValidationError("Unable to divide by zero.")
        }
    }
}



// MARK: - ModulusMode
extension ModulusOperandi.ModulusMode: EnumerableFlag {
}
