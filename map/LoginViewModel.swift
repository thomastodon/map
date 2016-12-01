import RxSwift
import RxCocoa

struct LoginViewModel {
    
    // TODO: no auto correct in username field?
    // TODO: appending Type to things?
    
    let disposeBag = DisposeBag()
    let userIsSignedIn: Observable<Bool>
    
    init(
        input: (
        username: Observable<String>,
        password: Observable<String>,
        loginTaps: Observable<Void>
        )
    ) {
        let usernameAndPassword = Observable.combineLatest(input.username, input.password) { ($0, $1) }
        
        userIsSignedIn = input.loginTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password) -> Observable<Bool> in
                print("username: \(username)")
                print("password: \(password)")
                return Observable<Bool>.empty()
        }
    }
}
