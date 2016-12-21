import Quick
import Nimble
import RxSwift

@testable import map

class LoginViewControllerSpec: QuickSpec {
    
    override func spec() {
        var mockViewModel: MockLoginViewModel!
        var viewController: LoginViewController!
        
        beforeEach {
            mockViewModel = MockLoginViewModel()
            viewController = LoginViewController(viewModel: mockViewModel)
        }
        
        describe("viewDidLoad") {
            it("binds the view model to the text fields") {
                viewController.usernameTextField.text = "username"
                expect(mockViewModel.username.value) == "username"
            }
        }
        
    }
}
