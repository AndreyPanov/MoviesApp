class MovieListPresenter {
  
  private weak var view: MovieListView?
  private let movies: [Movie]
  
  init(view: MovieListView, movies: [Movie]) {
    self.view = view
    self.movies = movies
  }
  
  func onViewDidLoad() {
    
  }
}
