class MovieListPresenter {
  
  private weak var view: MovieListView?
  private var movieViewModels: [MovieViewModel]
  private let repository: MovieListRepository
  
  init(view: MovieListView, movies: [Movie], repository: MovieListRepository = .init()) {
    self.view = view
    self.movieViewModels = movies.map { MovieViewModel(with: $0) }
    self.repository = repository
  }
  
  func onViewDidLoad() {
    view?.show(movies: movieViewModels)
  }
  
  func onRefresh() {
    repository.repeatLastSearch(onSuccess: { [weak self] movies in
      guard let `self` = self else { return }
      
      self.movieViewModels = movies.map { MovieViewModel(with: $0) }
      self.view?.endRefreshing()
      self.view?.show(movies: self.movieViewModels)
      
      }, onError: { [weak self] message in
        self?.view?.endRefreshing()
        self?.view?.show(message: message)
    })
  }
}
