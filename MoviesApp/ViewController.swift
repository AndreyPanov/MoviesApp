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
}
