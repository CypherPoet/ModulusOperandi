import Foundation


public enum ModulusMode: String, CaseIterable {

    /// The `remainder` is always positive.
    case euclidean

    /// The `remainder` always has the same sign as the `divisor`.
    case flooring

    /// The `remainder` always has the same sign as the `dividend`.
    case truncating
}
