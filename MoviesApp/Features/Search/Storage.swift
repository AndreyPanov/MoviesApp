import SwiftyUserDefaults

class Storage {
  
  private var suggestions: [String]
  
  init() {
    self.suggestions = Defaults[.suggestions] ?? []
  }
  
  func add(suggestion: String) {
    guard suggestions.first(where: { $0 == suggestion }) == nil else { return }
    
    if suggestions.count == 10 {
      suggestions.remove(at: 0)
    }
    suggestions.append(suggestion)
    Defaults[.suggestions] = suggestions
  }
  
  func getSuggestions() -> [String] {
    return suggestions
  }
  
  func getLastSuggestion() -> String? {
    return suggestions.last
  }
}

extension DefaultsKeys {
  static let suggestions = DefaultsKey<[String]?>("suggestions")
}
