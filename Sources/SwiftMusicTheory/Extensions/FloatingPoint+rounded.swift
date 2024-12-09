import CoreFoundation

public extension FloatingPoint {
  func rounded(toDecimal: Int) -> Self {
    let multiplier = Self(Int(pow(10, Double(toDecimal))))
    return (self * multiplier).rounded() / multiplier
  }
}
