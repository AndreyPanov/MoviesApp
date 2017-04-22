import UIKit
import TableKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView! {
    didSet {
      tableDirector = TableDirector(tableView: tableView)
      tableSection = TableSection()
      tableView.rowHeight = UITableViewAutomaticDimension
    }
  }
  var tableDirector: TableDirector!
  var tableSection: TableSection!
}
