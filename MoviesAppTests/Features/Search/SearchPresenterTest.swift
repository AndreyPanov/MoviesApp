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
  
  func testOnViewWillAppearWithSuggestions() {
    repository.state = .success
    
    presenter.onViewWillAppear()
    
    verify(repository).getLastSearchResults(onSuccess: { _ in })
    verify(view).show(suggestions: SuggestionBuilder.suggestions())
  }
  
  func testOnViewWillAppearWithNoSuggestions() {
    repository.state = .empty
    
    presenter.onViewWillAppear()
    
    verify(repository).getLastSearchResults(onSuccess: { _ in })
    verify(view, Times(times: never)).show(suggestions: SuggestionBuilder.suggestions())
  }
  
  func testSearchWithSuccess() {
    repository.state = .success
    var movies: [Movie] = []
    view.onMoviesSelected = { list in
      movies = list
    }
    
    presenter.onSearch("Batman")
    
    verify(repository).searchMovies(with: "Batman", onSuccess: { _ in }, onError: { _ in })
    verify(view).showLoadingIndicator()
    verify(view).hideLoadingIndicator()
    verify(view).show(suggestions: SuggestionBuilder.suggestions())
    XCTAssertEqual(movies.count, MovieBuilder.movies().count)
  }
  
  func testSearchWithFail() {
    repository.state = .failure
    
    presenter.onSearch("Batman")
    
    verify(repository).searchMovies(with: "Batman", onSuccess: { _ in }, onError: { _ in })
    verify(view).showLoadingIndicator()
    verify(view).hideLoadingIndicator()
    verify(view).show(message: "error")
  }
  
  func testSearchWithNilText() {
    presenter.onSearch(nil)
    
    verify(repository, Times(times: never)).searchMovies(with: "", onSuccess: { _ in }, onError: { _ in })
    verify(view, Times(times: never)).showLoadingIndicator()
    verify(view, Times(times: never)).hideLoadingIndicator()
    verify(view, Times(times: never)).show(suggestions: SuggestionBuilder.suggestions())
  }
}
