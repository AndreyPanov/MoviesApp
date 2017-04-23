import UIKit

protocol Refreshable: class {
  var refreshControl: UIRefreshControl? { get set }
}

internal extension Refreshable {
  
  
  
  func beginRefreshing() {
    refreshControl?.beginRefreshing()
  }
  
  func endRefreshing() {
    refreshControl?.endRefreshing()
  }
}
