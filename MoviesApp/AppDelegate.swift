import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    createAndPresentWindow()
    return true
  }
  
  func createAndPresentWindow() {
    
    let storyboard = UIStoryboard(name: "SearchScreen", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController")
    let navController = UINavigationController(rootViewController: controller)
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = navController
    window.makeKeyAndVisible()
    
    self.window = window
  }
}

