protocol Mock {
  
  associatedtype InstanceType
  var callHandler: CallHandler { get }

  func instanceType() -> InstanceType
  func verify(invoked: Invoke) -> InstanceType
}

extension Mock {

  func verify(invoked: Invoke) -> InstanceType {
    callHandler.verify(invoked: invoked)
    return instanceType()
  }
}
