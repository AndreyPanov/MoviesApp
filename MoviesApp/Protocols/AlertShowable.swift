import UIKit

protocol AlertShowable: class {
  func show(message text: String)
}

extension AlertShowable where Self: UIViewController {
  
  func show(message text: String) {
    let alertController = UIAlertController(title: nil, message: text, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in }
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}
