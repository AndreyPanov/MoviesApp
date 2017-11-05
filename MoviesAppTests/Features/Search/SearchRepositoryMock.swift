import XCTest

@testable import MoviesApp

class SearchRepositoryMock: SearchRepository, Mock {
  
  let callHandler: CallHandler
  var state: RepositoryMockState<[Movie]> = .success
  
  init(with testCase: BaseTestCase) {
    callHandler = CallHandler(withTestCase: testCase)
  }
  
  func instanceType() -> SearchRepositoryMock {
    return self
  }
  
  override func getLastSearchResults(onSuccess: @escaping ([String]) -> Void) {
    callHandler.accept(function: #function, file: #file, line: #line)
    
    switch state {
      case .success: onSuccess(SuggestionBuilder.suggestions())
      default: onSuccess([])
    }
  }
  
  override func searchMovies(with name: String, onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    callHandler.accept(function: #function, file: #file, line: #line)

    switch state {
      case .success: onSuccess(MovieBuilder.movies())
      case .failWith(let string): onError(string)
      default: onError("error")
    }
  }
}
