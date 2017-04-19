import UIKit
import TableKit

class SearchViewController: UIViewController, SearchView {
  
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableDirector = TableDirector(tableView: tableView)
      tableSection = TableSection()
      tableView.rowHeight = UITableViewAutomaticDimension
    }
  }
  @IBOutlet weak var searchBar: UISearchBar!
  
  var presenter: SearchPresenter!
  
  private var tableDirector: TableDirector!
  private var tableSection: TableSection!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    presenter = SearchPresenter(view: self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    searchBar.becomeFirstResponder()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    searchBar.resignFirstResponder()
  }
}

extension SearchViewController: UISearchBarDelegate {
  
  func set(searchText: String) {
    searchBar.text = searchText
    presenter.onSearchTextChanged(to: searchText)
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    presenter.onSearchTextChanged(to: searchBar.text)
    searchBar.resignFirstResponder()
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    presenter.onSearchTextChanged(to: searchText)
  }
}
