import UIKit

protocol Refreshable: class {
  var refreshControl: UIRefreshControl? { get set }
  func beginRefreshing()
  func endRefreshing()
}

extension Refreshable {
  
  func setRefreshControlOn(_ tableView: UITableView, action: Selector) {
    guard self.refreshControl == nil else { return }
    
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: action, for: .valueChanged)
    tableView.refreshControl = refreshControl
    self.refreshControl = refreshControl
  }
  
  func beginRefreshing() {
    refreshControl?.beginRefreshing()
  }
  
  func endRefreshing() {
    refreshControl?.endRefreshing()
  }
}
