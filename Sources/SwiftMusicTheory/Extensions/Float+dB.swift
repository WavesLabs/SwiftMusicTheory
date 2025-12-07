import Foundation

public extension Float {
  var dBFromPower: Self {
    self > 0 ? 10.0 * log10(self) : -.infinity
  }
  
  var dBToPower: Self {
    pow(10, self / 10)
  }
  
  var dBFromAmplitude: Self {
    self > 0 ? 20.0 * log10(self) : -.infinity
  }
  
  var dBToAmplitude: Self {
    pow(10, self / 20)
  }
}
