import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let viewModel = MainViewModel()
        let vc = MainViewController(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        let window = UIWindow()
        window.rootViewController = nc;
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}

