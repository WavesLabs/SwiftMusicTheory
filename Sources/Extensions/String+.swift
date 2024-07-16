import Foundation

extension String {
  public func repeating(times: Int) -> String {
    return Array(repeating: self, count: times).joined()
  }
}
