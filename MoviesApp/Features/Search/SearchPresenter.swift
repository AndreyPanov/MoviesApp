class SearchPresenter {
  
  private weak var view: SearchView?
  private var repository: SearchRepository
  
  init(view: SearchView, repository: SearchRepository = .init()) {
    self.view = view
    self.repository = repository
  }
  
  func onViewDidLoad() {
    repository.getLastSearchResults { [unowned self] suggestions in
      guard !suggestions.isEmpty else { return }
      self.view?.show(suggestions: suggestions)
    }
  }
  
  func onSearch(_ text: String?) {
    guard let text = text else { return }
    
    view?.showLoadingIndicator()
    repository.searchMovies(with: text, onSuccess: { [weak self] movies in
      self?.view?.hideLoadingIndicator()
      self?.view?.onMoviesSelected?(movies)
      
    }, onError: { [weak self] message in
      self?.view?.hideLoadingIndicator()
      self?.view?.show(message: message)
    })
  }
}
