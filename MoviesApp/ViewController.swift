import UIKit
import TableKit

class ViewController: UIViewController, Refreshable {
  
  var refreshControl: UIRefreshControl?
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableDirector = TableDirector(tableView: tableView)
      tableSection = TableSection()
      tableView.rowHeight = UITableViewAutomaticDimension
    }
  }
  var tableDirector: TableDirector!
  var tableSection: TableSection!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.accessibilityIdentifier = String(describing: type(of: self))
  }
  
  func setRefreshControlOnView(view: UIView, action: Selector, color: UIColor? = nil) {
    guard self.refreshControl == nil else { return }
    
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: action, for: .valueChanged)
    refreshControl.tintColor = color
    
    if #available(iOS 10.0, *), let tableView = view as? UITableView {
      tableView.refreshControl = refreshControl
    } else {
      view.addSubview(refreshControl)
    }
    
    self.refreshControl = refreshControl
  }
}
