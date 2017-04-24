import XCTest
import Mockit
@testable import MoviesApp

class SearchViewMock: SearchView, Mock {

  let callHandler: Mockit.CallHandler
  
  init(with testCase: XCTestCase) {
    callHandler = CallHandlerImpl(withTestCase: testCase)
  }
  
  func instanceType() -> SearchViewMock {
    return self
  }
  
  var onMoviesSelected: (([Movie]) -> Void)?
  
  func show(suggestions: [String]) {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: suggestions)
  }
  
  func showLoadingIndicator() {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
  }
  
  func hideLoadingIndicator() {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
  }
  
  func show(message text: String) {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
  }
  
  func toPresent() -> UIViewController? {
    return nil
  }
}
