import XCTest
import Mockit

extension XCTestCase {
  
  func verify(_ method: Int, times: Int = 1, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(
      method == times,
      "Given method is not invoked \(times), but invoked \(method) times.",
      file: file,
      line: line
    )
  }
  
  func verify<T: Mock>(_ mock: T, _ mode: VerificationMode = Once()) -> T.InstanceType {
    return mock.verify(verificationMode: mode)
  }
  
  var never: Int {
    return 0
  }
}
