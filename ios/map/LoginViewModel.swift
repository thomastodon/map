import RxSwift
import RxCocoa
import FirebaseAuth

protocol LoginViewModelType {
    var userIsSignedIn: Variable<String> { get }
    var username: Variable<String> { get }
    var password: Variable<String> { get }
}

struct LoginViewModel: LoginViewModelType {
    var userIsSignedIn: Variable<String>
    
    // TODO: no auto correct in username field?
    
    let disposeBag = DisposeBag()
    
    let username: Variable<String>
    let password: Variable<String>
    
    // components take other componenets as args always
    
    init() {
        _ = LoginClient(firebaseAuth: FIRAuth.auth()!)
        
        // TODO: orEmpty?
        username = Variable("")
        password = Variable("")
        
        _ = Observable.combineLatest(
            username.asObservable(),
            password.asObservable()
        ) { ($0, $1) }
        
        userIsSignedIn = Variable("")
        //        userIsSignedIn = loginTaps.withLatestFrom(usernameAndPassword)
        //            .flatMapLatest { (username, password) -> Observable<Result<User>> in
        //                return loginClient.login(username, password: password)
        //                    .observeOn(MainScheduler.instance)
        //            }
        //            .flatMapLatest { result -> Observable<String> in
        //                switch result {
        //                case .Success( _):
        //                    return Observable.just("signed in")
        //                case .Failure(let error):
        //                    return Observable.just(error.localizedDescription)
        //                }
    }
}


