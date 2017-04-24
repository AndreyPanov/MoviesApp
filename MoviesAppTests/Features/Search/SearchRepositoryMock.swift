import XCTest
import Mockit
@testable import MoviesApp

class SearchRepositoryMock: SearchRepository, Mock {
  
  let callHandler: Mockit.CallHandler
  var state: RepositoryMockState<[Movie]> = .success
  
  init(with testCase: XCTestCase) {
    callHandler = CallHandlerImpl(withTestCase: testCase)
  }
  
  func instanceType() -> SearchRepositoryMock {
    return self
  }
  
  override func getLastSearchResults(onSuccess: @escaping ([String]) -> Void) {
    
  }
  
  override func searchMovies(with name: String, onSuccess: @escaping ([Movie]) -> Void, onError: @escaping (String) -> Void) {
    callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: name)

    switch state {
    case .success:
      onSuccess(VehicleOptions())
    default:
      onError(Error())
    }
  }
}
