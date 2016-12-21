import UIKit
import Swinject
import Foundation
import RxSwift

struct AppContainer {
    static let shared = Container() { c in
        
        c.register(UINavigationController.self) { _ in
            UINavigationController()
        }.inObjectScope(.container)
        
        c.register(NavigatorType.self) { r in
            Navigator(
                navigationController: r.resolve(UINavigationController.self)!
            )
        }
        
        c.register(LoginViewController.self) { r in
            LoginViewController(
                viewModel: r.resolve(LoginViewModelType.self)!
            )
        }
        
        c.register(LoginViewModelType.self) { r in
            LoginViewModel()
        }
    }
}



