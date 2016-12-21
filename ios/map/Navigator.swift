import UIKit

protocol NavigatorType {
    func start()
}

struct Navigator: NavigatorType {
    
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(AppContainer.shared.resolve(LoginViewController.self)!, animated: false)
    }
}
