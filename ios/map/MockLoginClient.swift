//import RxSwift
//
//class MockLoginClient : LoginClientType {
//    
//    let _login: (String, String) -> Observable<Result<User>>
//    
//    init(
//        login: @escaping (String, String) -> Observable<Result<User>>
//        ) {
//        _login = login
//    }
//    
//    func login(_ username: String, password: String) -> Observable<Result<User>> {
//        return _login(username, password)
//    }
//}
