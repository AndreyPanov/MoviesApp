import MBProgressHUD

protocol IndicatorShowable: class {
  func showLoadingIndicator()
  func hideLoadingIndicator()
}

extension IndicatorShowable where Self: UIViewController {
  
  func showLoadingIndicator() {
    let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
    indicator.mode = .indeterminate
    indicator.show(animated: true)
  }
  
  func hideLoadingIndicator() {
    let indicator = MBProgressHUD(for: self.view)
    indicator?.hide(animated: false)
  }
}
