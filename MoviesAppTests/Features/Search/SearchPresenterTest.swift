import XCTest
@testable import MoviesApp

class SearchPresenterTest: BaseTestCase {
  
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
    verifyOrder()
  }
  
  func testOnViewWillAppearWithNoSuggestions() {
    repository.state = .empty
    
    presenter.onViewWillAppear()
    
    verify(repository).getLastSearchResults(onSuccess: { _ in })
    verifyOrder()
  }
  
  func testSearchWithSuccess() {
    repository.state = .success
    var movies: [Movie] = []
    view.onMoviesSelected = { list in
      movies = list
    }
    
    presenter.onSearch("Batman")
    
    verify(view).showLoadingIndicator()
    verify(repository).searchMovies(with: "Batman", onSuccess: { _ in }, onError: { _ in })
    verify(view).hideLoadingIndicator()
    verify(repository).getLastSearchResults(onSuccess: { _ in })
    verify(view).show(suggestions: SuggestionBuilder.suggestions())
    XCTAssertEqual(movies.count, MovieBuilder.movies().count)
    verifyOrder()
  }
  
  func testSearchWithFail() {
    repository.state = .failure
    
    presenter.onSearch("Batman")
    
    verify(view).showLoadingIndicator()
    verify(repository).searchMovies(with: "Batman", onSuccess: { _ in }, onError: { _ in })
    verify(view).hideLoadingIndicator()
    verify(view).show(message: "error")
    verifyOrder()
  }
  
  func testSearchWithNilText() {
    presenter.onSearch(nil)
    
    verify(repository, .never).searchMovies(with: "", onSuccess: { _ in }, onError: { _ in })
    verify(view, .never).showLoadingIndicator()
  }
}
