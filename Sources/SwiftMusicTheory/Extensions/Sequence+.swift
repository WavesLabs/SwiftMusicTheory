public extension Sequence {

  func makeDictionary<Key, Value>(producer: (Element) -> (Key, Value)) -> [Key: Value] {
    reduce(into: [:]) { resultDictionary, element in
      let (key, value) = producer(element)
      resultDictionary[key] = value
    }  
  }
}
