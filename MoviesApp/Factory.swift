import UIKit

class Factory {
  
  func makeSearchModule() -> SearchView {
    let storyboard = UIStoryboard(name: "SearchScreen", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
    controller.presenter = SearchPresenter(view: controller)
    return controller
  }
  
  func makeMovieListModule(with movies: [Movie]) -> MovieListView {
    let storyboard = UIStoryboard(name: "MovieListScreen", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
    controller.presenter = MovieListPresenter(view: controller, movies: movies)
    return controller
  }
}
