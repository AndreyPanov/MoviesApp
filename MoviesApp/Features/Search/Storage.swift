import SwiftyUserDefaults

class Storage {
  
  private var suggestions: [String]
  
  init() {
    self.suggestions = Defaults[.suggestions] ?? []
  }
  
  func add(suggestion: String) {
    if suggestions.count > 9 {
      suggestions.insert(suggestion, at: 0)
    } else {
      suggestions.append(suggestion)
    }
    Defaults[.suggestions] = suggestions
  }
  
  func getSuggestions() -> [String] {
    return suggestions
  }
}

extension DefaultsKeys {
  static let suggestions = DefaultsKey<[String]?>("suggestions")
}
