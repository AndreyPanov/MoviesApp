import XCTest

typealias Function = String

class BaseTestCase: XCTestCase {
  
  var callHistory: [Function]!
  var callMockHistory: [Function]!
  
  override open func setUp() {
    super.setUp()
    
    callHistory = []
    callMockHistory = []
  }
  
  override open func tearDown() {
    callHistory = nil
    callMockHistory = nil
    
    super.tearDown()
  }
  
  func verifyOrder(file: String = #file, line: UInt = #line) {
    guard callHistory.count == callMockHistory.count else {
      doFail(
        "Number of called functions are not equal: \(callHistory.count) != \(callMockHistory.count)",
        file: file,
        line: line
      )
      return
    }
    
    for (index, history) in callHistory.enumerated() {
      if history != callMockHistory[index] {
        doFail(
          "Called function \(history) are not \(callMockHistory[index]) from the test",
          file: file,
          line: line
        )
      }
    }
  }
  
  private func doFail(_ message: String, file: String, line: UInt) {
    recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
  }
}
