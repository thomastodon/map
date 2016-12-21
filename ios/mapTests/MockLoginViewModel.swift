import RxSwift

@testable import map

class MockLoginViewModel: LoginViewModelType {
    
    var userIsSignedIn = Variable<String>("signed in")
    var username = Variable<String>("username")
    var password = Variable<String>("password")
    
    var loginTaps: Observable<Void> = Observable.just()
    
    private let disposeBag = DisposeBag()
}
