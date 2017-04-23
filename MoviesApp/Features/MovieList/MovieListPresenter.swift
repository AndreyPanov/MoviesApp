class MovieListPresenter {
  
  private weak var view: MovieListView?
  private let movies: [Movie]
  private let repository: MovieListRepository
  
  init(view: MovieListView, movies: [Movie], repository: MovieListRepository = .init()) {
    self.view = view
    self.movies = movies
    self.repository = repository
  }
  
  func onViewDidLoad() {
    let viewModels = movies.map { MovieViewModel(with: $0) }
    view?.show(movies: viewModels)
  }
  
  func onShowMovie(with path: String) {
    
  }
}
