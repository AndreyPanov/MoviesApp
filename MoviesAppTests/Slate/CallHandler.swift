import XCTest

fileprivate enum State {
  case none, verify
}

class CallHandler {
  
  private var state = State.none
  private var invoked = Invoke.once
  private var callHistory: [String: UInt] = [:]
  private let testCase: BaseTestCase
  private var original: [Equivalent] = []
  private var verified: [Equivalent] = []
  private let verifyOrder: Bool
  
  init(withTestCase testCase: BaseTestCase, verifyOrder: Bool = true) {
    self.testCase = testCase
    self.verifyOrder = verifyOrder
  }
  
  func verify(invoked: Invoke) {
    self.invoked = invoked
    state = .verify
  }
  
  @discardableResult
  func accept(function: String, file: String, line: UInt) -> Self {
    switch state {
      case .none: recordCallHistory(ofFunction: function)
      case .verify:
        verifyCall(function: function, file: file, line: line)
        state = .none
    }
    return self
  }
  
  @discardableResult
  func join(with: Equivalent) -> Self {
    switch state {
      case .none: original.append(with)
      case .verify: verified.append(with)
    }
    return self
  }
  
  func check(function: String, file: String, line: UInt) {
    guard state == .verify else { return }
    
    for (index, value) in original.enumerated() {
      let verify = verified[index]
      if value != verify {
        doFail("Arguments are not equal for the method \(function)", file: file, line: line)
      }
    }
    state = .none
  }
  
  private func recordCallHistory(ofFunction function: String) {
    if let numberOfCalles = callHistory[function] {
      callHistory[function] = numberOfCalles + 1
    } else {
      callHistory[function] = 1
    }
    if verifyOrder {
      testCase.callHistory.append(function)
    }
  }
  
  private func verifyCall(function: String, file: String, line: UInt) {
    let timesCalled = callHistory[function] ?? 0
    var isCalledLikeExpected = false
    
    switch invoked {
    case .once:
      isCalledLikeExpected = timesCalled == 1
      if verifyOrder {
        testCase.callMockHistory.append(function)
      }
    case .times(let numberOfCalles):
      isCalledLikeExpected = timesCalled == numberOfCalles
      if verifyOrder {
        testCase.callMockHistory.append(function)
      }
    case .never:
      isCalledLikeExpected = timesCalled == 0
    }
    
    if !isCalledLikeExpected {
      doFail("Expected \(0) to be called %d times. It is actually called \(timesCalled) times", file: file, line: line)
    }
  }
  
  private func doFail(_ message: String, file: String, line: UInt) {
    testCase.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
  }
}
