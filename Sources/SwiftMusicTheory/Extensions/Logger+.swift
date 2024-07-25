import Foundation
import os

func logWarning(_ message: String) {
  if #available(macOS 11.0, iOS 14.0, *) {
    Logger(subsystem: "SwiftMusicTheory", category: "default").warning("\(message)")
  } else {
    print(message)
  }
}
