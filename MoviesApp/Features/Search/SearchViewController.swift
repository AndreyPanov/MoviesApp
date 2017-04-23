import UIKit
import TableKit

class SearchViewController: ViewController, SearchView {
  
  @IBOutlet weak var searchBar: UISearchBar!
  var presenter: SearchPresenter!
  
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
  
  func show(suggestions: [String]) {
    
  }
  
  func showMovieList(with movies: [Movie]) {
    let storyboard = UIStoryboard(name: "MovieListScreen", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
    controller.presenter = MovieListPresenter(view: controller, movies: movies)
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension SearchViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    presenter.onSearchTextChanged(to: searchBar.text)
    searchBar.resignFirstResponder()
  }
}
