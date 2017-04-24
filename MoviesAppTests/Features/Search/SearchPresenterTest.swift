import XCTest
import Mockit
@testable import MoviesApp

class SearchPresenterTest: XCTestCase {
  
  var presenter: SearchPresenter!
  
  var view: SearchViewMock!
  var repository: SearchRepositoryMock!
  
  override func setUp() {
    super.setUp()
    
    view = SearchViewMock(with: self)
    repository = SearchRepositoryMock(with: self)
    presenter = SearchPresenter(view: view, repository: repository)
  }
  
  override func tearDown() {
    
    view = nil
    repository = nil
    presenter = nil
    super.tearDown()
  }
  
  func testOnViewWillAppearSuggestions() {
    repository.state = .success
    
    presenter.onViewWillAppear()
    
    verify(view).show(suggestions: SuggestionBuilder.suggestions())
  }
  
  func testOnViewWillAppearNoSuggestions() {
    repository.state = .empty
    
    presenter.onViewWillAppear()
    
    verify(view, Times(times: never)).show(suggestions: SuggestionBuilder.suggestions())
  }
}

/*
 func onViewWillAppear() {
 updateSuggestions()
 }
 
 func onSearch(_ text: String?) {
 guard let text = text else { return }
 
 view?.showLoadingIndicator()
 repository.searchMovies(with: text, onSuccess: { [weak self] movies in
 self?.view?.hideLoadingIndicator()
 self?.updateSuggestions()
 self?.view?.onMoviesSelected?(movies)
 
 }, onError: { [weak self] message in
 self?.view?.hideLoadingIndicator()
 self?.view?.show(message: message)
 })
 }
 
 private func updateSuggestions() {
 repository.getLastSearchResults { [unowned self] suggestions in
 guard !suggestions.isEmpty else { return }
 self.view?.show(suggestions: suggestions)
 }
 }
 }
 */
