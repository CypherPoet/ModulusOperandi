# ModulusOperandi

<p>
    <img src="https://img.shields.io/badge/Swift-5.3-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-13.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-10.14+-179AC8.svg" />
    <img src="https://img.shields.io/badge/tvOS-13.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/watchOS-6.0+-1FD67A.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


<p align="center">

_Declarative, multi-algorithm modular arithmetic for Swift Integers and Floating-Point types._

Modular arithmetic algorithms [come in variants that use either Euclidean, truncating, or flooring division](https://en.wikipedia.org/wiki/Modulo_operation#Variants_of_the_definition). Furthermore, Swift's built-in `%` operator &mdash; while used as a modulus in some languages &mdash; is [strictly used as a _remainder_ operator](https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID64).

These nuances can lead modular arithmetic code that's ambiguous in both intent and correctness &mdash; which is what `ModulusOperandi` attempts to solve.

<p />


<!-- [[ Header Screenshot ]] -->
<!-- ![ModulusOperandi Header Image](./Resources/Screenshots/header.png) -->


## Features

- ✅ Declarative API that allows for choosing between [Euclidean](https://en.wikipedia.org/wiki/Euclidean_division#Division_theorem), [Truncating](https://developer.apple.com/documentation/swift/float/2886166-truncatingremainder), or [Flooring](https://www.sololearn.com/Discuss/1453039/floor-division-and-modulo-operator) Modular Arithmetic.
- ✅ Euclidean by default.
- ✅ Support for conformances to `BinaryInteger` and `FloatingPointInteger`.
- ✅ Command Line tool for performing calculations in the Terminal.


## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/CypherPoet/ModulusOperandi`.


### Swift Package Manager Projects

You can add `ModulusOperandi` as a dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(url: "https://github.com/CypherPoet/ModulusOperandi", from: "0.2.0"),
    ],
    //...
)
```

Then simply `import ModulusOperandi` wherever you’d like to use it.


## Usage

After importing `ModulusOperandi` in a file, types that conform to `BinaryInteger`  and  `FloatingPointInteger` will be extended with a `modulus` function.

This function treats its value as the `dividend` and takes a `divisor` of the same type. It also takes an optional `mode` argument to choose between Euclidean, Truncating, or Flooring Modular Arithmetic.

**By default, the `mode` will be Euclidean**

```swift
import ModulusOperandi

let dividend = 5
let divisor = 3

dividend.modulo(divisor)   // 2
dividend.modulo(-divisor)  // 2
-dividend.modulo(divisor)  // -2
-dividend.modulo(-divisor) // -2

// Same as...
dividend.modulo(divisor, mode: .euclidean)     // 2
dividend.modulo(-divisor, mode: .euclidean)    // 2
-dividend.modulo(divisor, mode: .euclidean)    // -2
-dividend.modulo(-divisor, mode: .euclidean)   // -2
```

```swift
import ModulusOperandi

let dividend = 5
let divisor = 3

dividend.modulo(3, mode: .flooring)    // 2
dividend.modulo(-3, mode: .flooring)   // -1
-dividend.modulo(3, mode: .flooring)   // -2
-dividend.modulo(-3, mode: .flooring)  // 1
```

```swift
import ModulusOperandi

let dividend = 5
let divisor = 3

dividend.modulo(3, mode: .truncating)    // 2
dividend.modulo(-3, mode: .truncating)   // 2
-dividend.modulo(3, mode: .truncating)   // -2
-dividend.modulo(-3, mode: .truncating)  // -2
```



ntation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

## Command Line Tool

`ModulusOperandi` also ships with a command line tool that lets you perform calculations directly from the command line.

To install it, clone the project and run `make`:

```
$ git clone git@github.com:CypherPoet/ModulusOperandi.git
$ cd ModulusOperandiCLI
$ make
```

The command line tool will be installed as `modulo`, and running `modulo --help` will present some helpful usage instructions:

```sh
modulo --help
```

```sh
Modular arithmetic algorithms can use either Euclidean, truncating, or flooring division (🔗 see https://en.wikipedia.org/wiki/Modulo_operation#Variants_of_the_definition).

This tool acts as a CLI for the `ModulusOperandi` Swift package -- which allows you to perform modular arithmetic
according to the algorithm of your choice.

USAGE: modulo <dividend> <divisor> [--euclidean] [--flooring] [--truncating]

ARGUMENTS:
  <dividend>              The dividend to perform division against.
  <divisor>               The divisor to use as a "modulus".

OPTIONS:
  --euclidean/--flooring/--truncating
                          The algorithm to use for computing results. (default: euclidean)
  --version               Show the version.
  -h, --help              Show help information.
```

### Negative Numbers

Disambiguating negative numbers from argument flags is a notorious challenge for Command Line interfaces. Currently, support for this in Swift's Argument Parser appears to be an [ongoing area of development](https://github.com/apple/swift-argument-parser/issues/31), In the meantime, though, the `modulo` command can take negative-number arguments via some clever escape syntax.

**Simply prefix any negative number with `\ ` (including the space). Like so:**

`-5 mod 4`:
```sh
modulo \ -5 4
```

`-5 mod -4`:
```sh
modulo \ -5 \ -4
```

`5 mod -4`:
```sh
modulo 5 \ -4
```

## Contributing

Contributions to `ModulusOperandi` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.


## Developing

### Requirements

- Xcode 12.0+ (for developing)


### Generating Documentation

Documentation is generated by [Jazzy](https://github.com/realm/jazzy). Installation instructions can be found [here](https://github.com/realm/jazzy#installation), and as soon as you have it set up, docs can be generated simply by running `jazzy` from the command line.



## License

`ModulusOperandi` is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
