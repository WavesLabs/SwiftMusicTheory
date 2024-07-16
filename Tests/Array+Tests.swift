import Testing
import SwiftMusicTheory
import Foundation

final class ArrayExtensionsTests {

  @Test func ArrayShifted() throws {
    var array = [0, 1, 2, 3, 4]
    var result = array.shifted(by: 1, in: .right)
    #expect(result == [4, 0, 1, 2, 3])

    result = array.shifted(by: 2, in: .left)
    #expect(result == [2, 3, 4, 0, 1])

    result = array.shifted(by: 5, in: .left)
    #expect(result == [0, 1, 2, 3, 4])

    result = array.shifted(by: 5, in: .right)
    #expect(result == [0, 1, 2, 3, 4])
  }

  @Test func ArrayShift() throws {
    var array = [0, 1, 2, 3, 4]
    var result = array.shift(by: 1, in: .right)
    #expect(array == [4, 0, 1, 2, 3])
    #expect(result == [4])

    result = array.shift(by: 2, in: .left)
    #expect(array == [1, 2, 3, 4, 0])
    #expect(result == [4, 0])
  }
}
