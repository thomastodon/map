import FirebaseAuth
import RxSwift

protocol LoginClientType {
//    func login(_ username: String, password: String) -> Observable<Result<User>>
}

enum Result<User> {
    case Success(User)
    case Failure(Error)
}

struct LoginClient {

    let firebaseAuth: FIRAuth
    
    init(firebaseAuth: FIRAuth) {
        self.firebaseAuth = firebaseAuth
    }

//    func login(_ username: String, password: String) -> Observable<Result<User>> {
//        return Observable.create{ (observer) -> Disposable in
//            self.firebaseAuth.signIn(withEmail: username, password: password) { (user, error) in
//                if let error = error {
//                    observer.on(Event.next(Result.Failure(error)))
//                } else {
//                    let user = User(username: username, password: password)
//                    observer.on(Event.next(Result.Success(user)))
//                }
//            }
//            
//            return Disposables.create()
//        }
//    }
}
