import XCTest

extension XCTestCase {
  
  func verify<T: Mock>(_ mock: T, _ invoked: Invoke = .once) -> T.InstanceType {
    return mock.verify(invoked: invoked)
  }
}
