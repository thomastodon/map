import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: LoginViewModelType
    
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: "LoginView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.rx.text.orEmpty.subscribe(onNext: { text in
            // TODO: what is orEmpty doing?
            self.viewModel.username.value = text
        })
            .addDisposableTo(disposeBag)
        
        //        viewModel.userIsSignedIn.subscribe().addDisposableTo(disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
