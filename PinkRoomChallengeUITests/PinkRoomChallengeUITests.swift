//
//  PinkRoomChallengeUITests.swift
//  PinkRoomChallengeUITests
//
//  Created by Catarina Pinto on 11/03/2024.
//

import XCTest
@testable import PinkRoomChallenge

final class PinkRoomChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignInButtonEnabled() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["E-mail"]
            emailTextField.tap()
            emailTextField.typeText("email@test.com")
        
        let passwordSecureField = app.secureTextFields["Password"]
            passwordSecureField.tap()
            passwordSecureField.typeText("password")
        
        let signInButton = app.buttons["Sign In"]
        XCTAssert(signInButton.isEnabled, "Sign in button should be enabled")
    }
    
    func testSignInButtonDisabledInvalidEmailFormat() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["E-mail"]
            emailTextField.tap()
            emailTextField.typeText("email")
        
        let passwordSecureField = app.secureTextFields["Password"]
            passwordSecureField.tap()
            passwordSecureField.typeText("password")
        
        let signInButton = app.buttons["Sign In"]
        XCTAssertFalse(signInButton.isEnabled, "Sign in button should be disabled")
    }
    
    func testSignInButtonDisabledEmptyEmail() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["E-mail"]
            emailTextField.tap()
            emailTextField.typeText("")
        
        let passwordSecureField = app.secureTextFields["Password"]
            passwordSecureField.tap()
            passwordSecureField.typeText("password")
        
        let signInButton = app.buttons["Sign In"]
        XCTAssertFalse(signInButton.isEnabled, "Sign in button should be disabled")
    }
    
    func testSignInButtonDisabledEmptyPassword() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["E-mail"]
            emailTextField.tap()
            emailTextField.typeText("email@test.com")
        
        let passwordSecureField = app.secureTextFields["Password"]
            passwordSecureField.tap()
            passwordSecureField.typeText("")
        
        let signInButton = app.buttons["Sign In"]
        XCTAssertFalse(signInButton.isEnabled, "Sign in button should be disabled")
    }
    
    func testSignInButtonDisabledEmptyEmailAndPassword() {
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["E-mail"]
            emailTextField.tap()
            emailTextField.typeText("")
        
        let passwordSecureField = app.secureTextFields["Password"]
            passwordSecureField.tap()
            passwordSecureField.typeText("")
        
        let signInButton = app.buttons["Sign In"]
        XCTAssertFalse(signInButton.isEnabled, "Sign in button should be disabled")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
