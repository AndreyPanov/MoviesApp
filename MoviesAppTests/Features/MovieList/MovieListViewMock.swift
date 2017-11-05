import XCTest
@testable import MoviesApp

class MovieListViewMock: MovieListView, Mock {
  
  let callHandler: CallHandler
  var refreshControl: UIRefreshControl?
  
  init(with testCase: BaseTestCase) {
    callHandler = CallHandler(withTestCase: testCase)
  }
  
  func instanceType() -> MovieListViewMock {
    return self
  }
  
  func show(movies: [MovieViewModel]) {
    callHandler.accept(function: #function, file: #file, line: #line)
  }
  
  func show(message text: String) {
    callHandler.accept(function: #function, file: #file, line: #line)
  }
  
  func beginRefreshing() {
    callHandler.accept(function: #function, file: #file, line: #line)
  }
  
  func endRefreshing() {
    callHandler.accept(function: #function, file: #file, line: #line)
  }
  
  func toPresent() -> UIViewController? {
    return nil
  }
}
