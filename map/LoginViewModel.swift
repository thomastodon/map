import RxSwift
import RxCocoa

struct LoginViewModel {
    
    // TODO: no auto correct in username field?
    // TODO: appending Type to things?
    
    let disposeBag = DisposeBag()
    
    let userIsSignedIn: Driver<Bool>
    
    init(
        input: (
            username: Driver<String>,
            password: Driver<String>,
            loginTaps: Driver<Void>
        )
    ) {
        let usernameAndPassword = Driver.combineLatest(input.username, input.password) { ($0, $1) }
        
        userIsSignedIn = input.loginTaps.withLatestFrom(usernameAndPassword)
            .flatMapLatest { (username, password) -> Driver<Bool> in
                print("username: \(username)")
                print("password: \(password)")
                return Driver<Bool>.empty()
            }
    }
    
}
