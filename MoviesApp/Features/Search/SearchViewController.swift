import UIKit
import TableKit

class SearchViewController: ViewController, SearchView, UISearchBarDelegate {
  
  @IBOutlet weak var searchBar: UISearchBar!
  var onMoviesSelected: (([Movie]) -> Void)?
  var presenter: SearchPresenter!

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "search_screen_title".localized
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter.onViewWillAppear()
    searchBar.becomeFirstResponder()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    searchBar.resignFirstResponder()
  }
  
  func show(suggestions: [String]) {
    let action = TableRowAction<SuggestionCell>(.click) { [unowned self] options in
      self.presenter.onSearch(options.item)
    }
    let rows: [Row] = suggestions.map { TableRow<SuggestionCell>(item: $0, actions: [action]) }
    tableSection.append(rows: rows)
    tableDirector += tableSection
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    presenter.onSearch(searchBar.text)
    searchBar.resignFirstResponder()
  }
}
