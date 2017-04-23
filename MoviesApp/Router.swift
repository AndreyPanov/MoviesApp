import UIKit

class Router {
  
  private weak var rootController: UINavigationController?
  
  init(with rootController: UINavigationController) {
    self.rootController = rootController
  }
  
  func setRootModule(_ module: Presentable) {
    guard let controller = module.toPresent() else { return }
    rootController?.setViewControllers([controller], animated: false)
  }
  
  func push(_ module: Presentable) {
    guard let controller = module.toPresent() else { return }
    rootController?.pushViewController(controller, animated: true)
  }
}
