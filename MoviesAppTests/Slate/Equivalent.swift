import Foundation

enum Equivalent: Equatable {
  case int(Int?)
  case string(String?)
  case strings([String])
  case date(Date?)
}

func == (lhs: Equivalent, rhs: Equivalent) -> Bool {
  switch (lhs, rhs) {
  case (let .int(value1), let .int(value2)):
    return value1 == value2
    
  case (let .string(value1), let .string(value2)):
    return value1 == value2
    
  case (let .strings(value1), let .strings(value2)):
    return value1 == value2
    
  case (let .date(value1), let .date(value2)):
    return value1 == value2

  default:
    return false
  }
}
