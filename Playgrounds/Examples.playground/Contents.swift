import UIKit
import ModulusOperandi

let dividend = 5
let divisor = 3

dividend.modulo(divisor)
dividend.modulo(-divisor)
-dividend.modulo(divisor)
-dividend.modulo(-divisor)


dividend.modulo(divisor, mode: .euclidean)
dividend.modulo(-divisor, mode: .euclidean)
-dividend.modulo(divisor, mode: .euclidean)
-dividend.modulo(-divisor, mode: .euclidean)


dividend.modulo(divisor, mode: .flooring)
dividend.modulo(-divisor, mode: .flooring)
-dividend.modulo(divisor, mode: .flooring)
-dividend.modulo(-divisor, mode: .flooring)


dividend.modulo(divisor, mode: .truncating)
dividend.modulo(-divisor, mode: .truncating)
-dividend.modulo(divisor, mode: .truncating)
-dividend.modulo(-divisor, mode: .truncating)

