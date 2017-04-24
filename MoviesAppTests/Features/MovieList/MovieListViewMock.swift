import XCTest
import Mockit
@testable import MoviesApp

class MovieListViewMock: MovieListView, Mock {
  
  let callHandler: Mockit.CallHandler
  var refreshControl: UIRefreshControl?
  
  init(with testCase: XCTestCase) {
    callHandler = CallHandlerImpl(withTestCase: testCase)
  }
  
  func instanceType() -> MovieListViewMock {
    return self
  }
  
  func show(movies: [MovieViewModel]) {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: movies)
  }
  
  func show(message text: String) {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
  }
  
  func beginRefreshing() {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
  }
  
  func endRefreshing() {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
  }
  
  func toPresent() -> UIViewController? {
    return nil
  }
}
