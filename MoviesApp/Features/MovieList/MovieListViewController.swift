import UIKit
import TableKit

class MovieListViewController: ViewController, MovieListView {
  
  var presenter: MovieListPresenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
  
  func show(movies: [MovieViewModel]) {
    let rows: [Row] = movies.map { TableRow<MovieListCell>(item: $0) }
    tableSection.append(rows: rows)
    tableDirector += tableSection
  }
}
