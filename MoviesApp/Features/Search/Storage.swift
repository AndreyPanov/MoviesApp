import SwiftyUserDefaults

class Storage {
  
  func add(suggestion: String) {
    
  }
  
  func getSuggestions() -> [String] {
    return Defaults[.suggestions] ?? []
  }
}

extension DefaultsKeys {
  static let suggestions = DefaultsKey<[String]?>(#file)
}
