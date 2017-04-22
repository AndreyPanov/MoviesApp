class SearchPresenter {
  
  private weak var view: SearchView?
  private var repository: SearchRepository
  
  init(view: SearchView, repository: SearchRepository = .init()) {
    self.view = view
    self.repository = repository
  }
  
  func onViewDidLoad() {
    repository.getLastSearchResults { movies in
      guard !movies.isEmpty else { return }
      
    }
  }
  
  func onSearchTextChanged(to text: String?) {
    guard let text = text else { return }
    repository.searchMovies(with: text, onSuccess: { [weak self] movies in
      
    }, onError: { [weak self] message in
      
    })
  }
}
