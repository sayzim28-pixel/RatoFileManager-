import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = MainViewController()
        let navController = UINavigationController(rootViewController: rootVC)
        
        // Estética Cyberpunk: Barra de navegação escura
        navController.navigationBar.barTintColor = .black
        navController.navigationBar.tintColor = UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 1.0) // Neon Green
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}