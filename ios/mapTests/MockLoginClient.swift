import RxSwift

struct MockLoginClient : LoginClientType {
    
    func login(_ username: String, password: String) -> Observable<Result<User>> {
        return scheduler.mock(values: booleans, errors: errors) { (username, password) -> String in
            if username == "secretusername" && password == "secret" {
                return "--t"
            }
            else {
                return "--f"
            }
        }
    }
}
