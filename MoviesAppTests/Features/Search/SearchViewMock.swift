import XCTest
@testable import MoviesApp

class SearchViewMock: SearchView, Mock {

  let callHandler: CallHandler
  
  init(with testCase: BaseTestCase) {
    callHandler = CallHandler(withTestCase: testCase)
  }
  
  func instanceType() -> SearchViewMock {
    return self
  }
  
  var onMoviesSelected: (([Movie]) -> Void)?
  
  func show(suggestions: [String]) {
    callHandler
      .accept(function: #function, file: #file, line: #line)
      .join(with: .strings(suggestions))
      .check(function: #function, file: #file, line: #line)
  }
  
  func showLoadingIndicator() {
    callHandler.accept(function: #function, file: #file, line: #line)
  }
  
  func hideLoadingIndicator() {
    callHandler.accept(function: #function, file: #file, line: #line)
  }
  
  func show(message text: String) {
    callHandler
      .accept(function: #function, file: #file, line: #line)
      .join(with: .string(text))
      .check(function: #function, file: #file, line: #line)
  }
  
  func toPresent() -> UIViewController? {
    return nil
  }
}
