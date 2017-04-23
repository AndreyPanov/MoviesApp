import Foundation

extension String {
  
  var localized: String {
    return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
  
  var trimmed: String {
    return self.replacingOccurrences(of: " ", with: "+")
  }
}
