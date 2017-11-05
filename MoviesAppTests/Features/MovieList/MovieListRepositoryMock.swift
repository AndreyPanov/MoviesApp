import XCTest
@testable import MoviesApp

class MovieListRepositoryMock: MovieListRepository, Mock {
  
  let callHandler: CallHandler
  var state: RepositoryMockState<[Movie]> = .success
  
  init(with testCase: BaseTestCase) {
    callHandler = CallHandler(withTestCase: testCase)
  }
  
  func instanceType() -> MovieListRepositoryMock {
    return self
  }
  
  override func repeatLastSearch(onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    callHandler.accept(function: #function, file: #file, line: #line)
    
    switch state {
      case .success: onSuccess(MovieBuilder.movies())
      case .failWith(let string): onError(string)
      default: onError("error")
    }
  }
}
