import Foundation

public enum HorizontalDirection: Int {
  case right = 1
  case left = -1
}

public enum VerticalDirection: Int {
  case up = 1
  case down = -1
}

public extension Array {
  init(capacityToReserve: Int) {
    var array = Array<Element>()
    array.reserveCapacity(capacityToReserve)
    self = array
  }
}

public extension Array {
  subscript (cycled index: Index) -> Element {
    self[index % count]
  }
}

public extension Array {
  func appending(_ newElements: Self) -> Self {
    var collection = self
    collection.append(contentsOf: newElements)
    return collection
  }
}

public extension Array {
  func shifted(by amount: Int, in direction: HorizontalDirection = .right) -> Array {
    var result = self
    _ = result.shift(by: amount, in: direction)
    return result
  }
  
  // Shifts the array by specified amount of elements in HorizontalDirection and returns ArraySlice of shifted elements
  mutating func shift(by amount: Int, in direction: HorizontalDirection = .right) -> ArraySlice<Element> {
    var shifted: ArraySlice<Element>
    
    switch direction {
    case .left:
      shifted = self.removeFirst(elementsCount: amount)
      self.append(contentsOf: shifted)
    case .right:
      shifted = self.removeLast(elementsCount: amount)
      self.insert(contentsOf: shifted, at: 0)
    }
    
    return shifted
  }
}

public extension Array {
  mutating func removeFirst(elementsCount: Int) -> ArraySlice<Element> {
    let removed = self[0..<elementsCount]
    removeFirst(elementsCount)
    return removed
  }
  
  mutating func removeLast(elementsCount: Int) -> ArraySlice<Element> {
    let removed = self[(count - elementsCount)..<count]
    removeLast(elementsCount)
    return removed
  }
}

public extension Array {
  func batched(by batchSize: Int) -> [[Element]] {
    guard batchSize > 0 else { return [self] }
    var result: [[Element]] = []
    var currentBatch: [Element] = []
    
    for element in self {
      currentBatch.append(element)
      if currentBatch.count == batchSize {
        result.append(currentBatch)
        currentBatch = []
      }
    }
    
    if !currentBatch.isEmpty {
      result.append(currentBatch)
    }
    
    return result
  }
}

public extension Array {
  /// Returns the first index in the array where `predicate` returns `true`.
  ///
  /// This method assumes that if `predicate` returns `true` for an element, it will continue to return `true` for all subsequent elements.
  ///
  /// - Parameter predicate: A closure that returns `true` for elements that satisfy the condition.
  /// - Returns: The index of the first element for which `predicate` returns `true`, or `count` if no such element is found.
  func firstIndexBinarySearch(mathcing predicate: (Element) -> Bool) -> Int {
    var low = 0
    var high = count
    
    while low < high {
      let mid = low + (high - low) / 2
      if predicate(self[mid]) {
        high = mid
      } else {
        low = mid + 1
      }
    }
    return low
  }
}
