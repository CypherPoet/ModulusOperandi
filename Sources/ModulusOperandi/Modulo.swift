import Foundation


extension Numeric where Self: BinaryFloatingPoint {

    public func modulo(_ divisor: Self, mode: ModulusMode = .euclidean) -> Self {
        guard divisor != 0 else {
            preconditionFailure("Can't perform division by 0.")
        }

        switch mode {
        case .euclidean:
            return euclideanMod(dividend: self, divisor: divisor)
        case .flooring:
            return flooringMod(dividend: self, divisor: divisor)
        case .truncating:
            return truncatingMod(dividend: self, divisor: divisor)
        }
    }
}


extension Numeric where Self: BinaryInteger {

    public func modulo(_ divisor: Self, mode: ModulusMode = .euclidean) -> Self {
        guard divisor != 0 else {
            preconditionFailure("Can't perform division by 0.")
        }
        
        switch mode {
        case .euclidean:
            return euclideanMod(dividend: self, divisor: divisor)
        case .flooring:
            return flooringMod(dividend: self, divisor: divisor)
        case .truncating:
            return truncatingMod(dividend: self, divisor: divisor)
        }
    }
}


// MARK: - `BinaryInteger` Helpers
private func truncatingMod<T: BinaryInteger>(dividend: T, divisor: T) -> T {
    dividend.quotientAndRemainder(dividingBy: divisor).remainder
}

private func flooringMod<T: BinaryInteger>(dividend: T, divisor: T) -> T {
    let remainder = truncatingMod(dividend: dividend, divisor: divisor)
    let newDividend = remainder + divisor

    return truncatingMod(dividend: newDividend, divisor: divisor)
}

private func euclideanMod<T: BinaryInteger>(dividend: T, divisor: T) -> T {
    if divisor < 0 {
        return flooringMod(dividend: dividend, divisor: divisor * -1)
    } else {
        return flooringMod(dividend: dividend, divisor: divisor)
    }
}



// MARK: - `BinaryFloatingPoint` Helpers
private func truncatingMod<T: BinaryFloatingPoint>(dividend: T, divisor: T) -> T {
    dividend.truncatingRemainder(dividingBy: divisor)
}

private func flooringMod<T: BinaryFloatingPoint>(dividend: T, divisor: T) -> T {
    let remainder = truncatingMod(dividend: dividend, divisor: divisor)
    let newDividend = remainder + divisor

    return truncatingMod(dividend: newDividend, divisor: divisor)
}

private func euclideanMod<T: BinaryFloatingPoint>(dividend: T, divisor: T) -> T {
    if divisor < 0 {
        return flooringMod(dividend: dividend, divisor: divisor * -1)
    } else {
        return flooringMod(dividend: dividend, divisor: divisor)
    }
}
