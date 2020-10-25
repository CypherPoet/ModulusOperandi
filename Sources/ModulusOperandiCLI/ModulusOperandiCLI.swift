import Foundation
import ArgumentParser
import ModulusOperandi


/// Helper that allows for parsing negative-number strings using
/// an escaped space, followed by a `-`.
func parseNumberArgument(_ string: String) -> Double? {
    Double(string.trimmingCharacters(in: .whitespacesAndNewlines))
}

let negativeNumberDiscussion = """
To use negative numbers, prefix the argument with `\\ ` (including the space).

For example, -5 mod 4 would be passed as:
    modulo \\ -5 4

-5 mod -4 would be passed as:
    modulo \\ -5 \\ -4

"""


struct ModulusOperandiCLI {

    @Argument(
        help: ArgumentHelp(
            """
            The dividend to perform division against.
            """,
            discussion: negativeNumberDiscussion
        ),
        transform: parseNumberArgument
    )
    var dividend: Double?


    @Argument(
        help: ArgumentHelp(
            """
            The divisor to use as a "modulus".
            """,
            discussion: negativeNumberDiscussion
        ),
        transform: parseNumberArgument
    )
    var divisor: Double?


    @Flag(
        exclusivity: FlagExclusivity.exclusive,
        help: """
        The algorithm to use for computing results.
        """
    )
    var mode: ModulusOperandi.ModulusMode = .euclidean

}


// MARK: - ParsableCommand
extension ModulusOperandiCLI: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "modulo",
        abstract: """
        Multi-algorithm modular arithmetic for Swift integers and floating-Point types.
        """,
        discussion: """
        Modular arithmetic algorithms come in variants that use either Euclidean, truncating, \
        or flooring division.

        (🔗 See: https://en.wikipedia.org/wiki/Modulo_operation#Variants_of_the_definition)

        This tool acts as a CLI for the `ModulusOperandi` Swift package -- which allows you to perform \
        modular arithmetic according to your desired algorithm.
        """,
        version: "0.2.0",
        shouldDisplay: true,
        subcommands: []
    )


    func run() throws {
        guard
            let divisor = divisor,
            let dividend = dividend
        else {
            preconditionFailure()
        }

        print(dividend.modulo(divisor, mode: mode))
    }


    func validate() throws {
        guard let _ = dividend else {
            throw ValidationError("Invalid dividend")
        }

        guard let divisor = divisor else {
            throw ValidationError("Invalid divisor")
        }

        if divisor == 0 {
            throw ValidationError("Unable to divide by zero. Please use a different dividend.")
        }
    }
}



// MARK: - ModulusMode Extensions
extension ModulusOperandi.ModulusMode: EnumerableFlag {}
