class SearchPresenter {
  
  private weak var view: SearchView?
  private var repository: SearchRepository
  
  init(view: SearchView, repository: SearchRepository = .init()) {
    self.view = view
    self.repository = repository
  }
  
  func onViewDidLoad() {
    
  }
  
  func onSearchTextChanged(to text: String?) {
    
  }
}
