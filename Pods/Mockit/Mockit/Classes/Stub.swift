//
//  Mockit
//
//  Copyright (c) 2016 Syed Sabir Salman-Al-Musawi <sabirvirtuoso@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/**
 * `Stub` is used to record details of stub registration as well as performing necessary actions on a stub
 * when an actual call is made
 */
public class Stub {

  public var actualArgs = [Any?]()
  public var callCount = 0

  private var expectedArgs = [Any?]()
  private var functionName: String!
  private var argumentMatchers = [ArgumentMatcher]()

  private var actionPerformer: ActionPerformer!

  public init() {

  }

  public func call<T: Any>(withReturnValue returnValue: T?,
                   andArgumentMatching argumentMatchers: [ArgumentMatcher] = []) -> Actionable<T?> {
    self.argumentMatchers = argumentMatchers

    guard assertArgumentMatcherCount() else {
      fatalError("There is a mismatch between number of expected arguments and its corresponding matcher")
    }

    let actionable = Actionable(ofStub: self, withReturnValue: returnValue)
    actionPerformer = actionable

    return actionable
  }

  public func acceptStub(withFunctionName functionName: String, andExpectedArgs expectedArgs: [Any?]) {
    self.functionName = functionName
    self.expectedArgs = expectedArgs
  }

  public func satisfyStub(withFunctionName functionName: String) -> Bool {
    return self.functionName == functionName
  }

  public func satisfyStub(withActualArgs actualArgs: [Any?]) -> Bool {
    callCount += 1
    self.actualArgs = actualArgs

    guard argumentMatchers.count > 0 else {
      return MockMatcher.sharedInstance.match(arguments: expectedArgs, withArguments: actualArgs)
    }

    return satisfyArgumentMatcher()
  }

  private func satisfyArgumentMatcher() -> Bool {
    var argumentsMatched = true

    for (index, argumentMatcher) in argumentMatchers.enumerate() {
      if !argumentMatcher.match(arguments: expectedArgs[index], withArguments: actualArgs[index]) {
        argumentsMatched = false

        break
      }
    }

    return argumentsMatched
  }

  public func performActions() -> Any? {
    return actionPerformer.performActions()
  }

  private func assertArgumentMatcherCount() -> Bool {
    if argumentMatchers.count > 0 && argumentMatchers.count != expectedArgs.count {
      return false
    }

    return true
  }

}
