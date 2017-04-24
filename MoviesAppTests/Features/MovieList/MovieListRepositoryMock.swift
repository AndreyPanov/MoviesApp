import XCTest
import Mockit
@testable import MoviesApp

class MovieListRepositoryMock: MovieListRepository, Mock {
  
  let callHandler: Mockit.CallHandler
  var state: RepositoryMockState<[Movie]> = .success
  
  init(with testCase: XCTestCase) {
    callHandler = CallHandlerImpl(withTestCase: testCase)
  }
  
  func instanceType() -> MovieListRepositoryMock {
    return self
  }
  
  override func repeatLastSearch(onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil)
    
    switch state {
      case .success: onSuccess(MovieBuilder.movies())
      case .failWith(let string): onError(string)
      default: onError("error")
    }
  }
}
