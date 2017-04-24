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
  
  
}
