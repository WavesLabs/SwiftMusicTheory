import Foundation

extension String {
  public func repeating(times: Int) -> String {
    return Array(repeating: self, count: times).joined()
  }
}

extension String {
  public mutating func uppercase() {
    self = uppercased()
  }

  public mutating func lowercase() {
    self = lowercased()
  }
}
