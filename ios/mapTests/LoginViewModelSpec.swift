import XCTest
import RxSwift
import RxCocoa
import Foundation

@testable import map

class LoginViewModelSpec: XCTestCase {
    
    var viewModel: LoginViewModel!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
    }
    
    func testButtonIsDisabled() {
        viewModel = LoginViewModel(
            username: Observable.just("thomas.shouler@gmail.com"),
            password: Observable.just("hellomaaya"),
            loginTaps: Observable.just()
        )
        
        var elements = [String]()
        viewModel.userIsSignedIn
            .subscribe(onNext: { s in
                elements.append(s)
            })
            .addDisposableTo(disposeBag)
        
        XCTAssertEqual(elements[0], "signd in")
    }
    
    override func tearDown() {
        super.tearDown()
        disposeBag = nil
    }
}
