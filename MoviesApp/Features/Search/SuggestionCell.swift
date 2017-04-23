import UIKit
import TableKit

class SuggestionCell: UITableViewCell, ConfigurableCell {
  
  func configure(with suggestion: String) {
    textLabel?.text = suggestion
  }
}
