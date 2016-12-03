import XCTest
import RxTest

let resolution: TimeInterval = 0.2 // seconds


class RxExample_iOSTests: XCTestCase {
    
    let booleans = ["t" : true, "f" : false]
    let events = ["x" : ()]
    let errors = [
        "#1" : NSError(domain: "Some unknown error maybe", code: -1, userInfo: nil),
        "#u" : NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil)
    ]
    let validations = [
        "e" : ValidationResult.empty,
        "f" : ValidationResult.failed(message: ""),
        "o" : ValidationResult.ok(message: "Validated"),
        "v" : ValidationResult.validating
    ]
    
    let stringValues = [
        "u1" : "verysecret",
        "u2" : "secretuser",
        "u3" : "secretusername",
        "p1" : "huge secret",
        "p2" : "secret",
        "e" : ""
    ]
    
    ////////////////////////////////////////////////////////////////////////////////
    // This is test of enabled user interface elements.
    // I guess you could do this for view models, but this is probably overkill to
    // do.
    //
    // It's probably more suitable for some vital components of your system, but
    // the pricinciple is the same.
    ////////////////////////////////////////////////////////////////////////////////
    func testGitHubSignup_vanillaObservables_1_testEnabledUserInterfaceElements() {
        let scheduler = TestScheduler(initialClock: 0, resolution: resolution, simulateProcessingDelay: false)
        
        // mock the universe
        let mockAPI = mockGithubAPI(scheduler: scheduler)
        
        // expected events and test data
        let (
        usernameEvents,
            passwordEvents,
                repeatedPasswordEvents,
                    loginTapEvents,
                        
                        expectedValidatedUsernameEvents,
                            expectedSignupEnabledEvents
                                ) = (
                                    scheduler.parseEventsAndTimes(timeline: "e---u1----u2-----u3------------------", values: stringValues).first!,
                                    scheduler.parseEventsAndTimes(timeline: "e----------------------p1------------", values: stringValues).first!,
                                    scheduler.parseEventsAndTimes(timeline: "e---------------------------p2---p1--", values: stringValues).first!,
                                    scheduler.parseEventsAndTimes(timeline: "-------------------------------------", values: events).first!,
                                    
                                    scheduler.parseEventsAndTimes(timeline: "e---v--f--v--f---v--o----------------", values: validations).first!,
                                    scheduler.parseEventsAndTimes(timeline: "f--------------------------------t---", values: booleans).first!
        )
        
        let wireframe = MockWireframe()
        let validationService = GitHubDefaultValidationService(API: mockAPI)
        
        let viewModel = GithubSignupViewModel1(
            input: (
                username: scheduler.createHotObservable(usernameEvents).asObservable(),
                password: scheduler.createHotObservable(passwordEvents).asObservable(),
                repeatedPassword: scheduler.createHotObservable(repeatedPasswordEvents).asObservable(),
                loginTaps: scheduler.createHotObservable(loginTapEvents).asObservable()
            ),
            dependency: (
                API: mockAPI,
                validationService: validationService,
                wireframe: wireframe
            )
        )
        
        // run experiment
        let recordedSignupEnabled = scheduler.record(source: viewModel.signupEnabled)
        let recordedValidatedUsername = scheduler.record(source: viewModel.validatedUsername)
        
        scheduler.start()
        
        // validate
        XCTAssertEqual(recordedValidatedUsername.events, expectedValidatedUsernameEvents)
        XCTAssertEqual(recordedSignupEnabled.events, expectedSignupEnabledEvents)
    }
}
