class AppCoordinator: Coordinator {
  
  private let router: Router
  private let factory: Factory
  
  init(router: Router, factory: Factory = .init()) {
    self.router = router
    self.factory = factory
  }
  
  func start() {
    showSearchModule()
  }
  
  private func showSearchModule() {
    let searchModule = factory.makeSearchModule()
    searchModule.onMoviesSelected = { [weak self] movies in
      self?.showMovieList(with: movies)
    }
    router.setRootModule(searchModule)
  }
  
  private func showMovieList(with movies: [Movie]) {
    let movieListModule = factory.makeMovieListModule(with: movies)
    router.push(movieListModule)
  }
}
