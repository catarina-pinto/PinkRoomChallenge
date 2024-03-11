//
//  LoginViewModeliOSTests.swift
//  TrainiOSTests
//
//  Created by Catarina Pinto on 08/03/2024.
//

import XCTest
@testable import PinkRoomChallenge

final class LoginViewModelTests: XCTestCase {
    var loginViewModel: LoginViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        loginViewModel = LoginViewModel(presentPopup: .constant(false))
    }
    
    override func tearDownWithError() throws {
        loginViewModel = nil
        try super.tearDownWithError()
    }
    
    func testSignInDisabledInvalidEmailFormat() {
        loginViewModel.email = "abc"
        loginViewModel.password = "123"
        
        XCTAssert(loginViewModel.signInDisabled(), "Something went wrong")
    }
    
    func testSignInDisabledEmptyPassword() {
        loginViewModel.email = "abc"
        loginViewModel.password = ""
        
        XCTAssert(loginViewModel.signInDisabled(), "Something went wrong")
    }
    
    func testSignInDisabledEmptyEmail() {
        loginViewModel.email = ""
        loginViewModel.password = "123"
        
        XCTAssert(loginViewModel.signInDisabled(), "Something went wrong")
    }
    
    func testSignInDisabledEmptyEmailAndPassword() {
        loginViewModel.email = ""
        loginViewModel.password = ""
        
        XCTAssert(loginViewModel.signInDisabled(), "Something went wrong")
    }
    
    func testSignInDisabledValidEmailAndPassword() {
        loginViewModel.email = "abc@c.com"
        loginViewModel.password = "123"
        
        XCTAssertFalse(loginViewModel.signInDisabled(), "Something went wrong")
    }
    
    func testAuthenticateWithUnauthorizedUser() {
        loginViewModel.email = "a@b.cd"
        loginViewModel.password = "123"
        loginViewModel.authenticate()
        
        XCTAssertFalse(loginViewModel.shouldNavigate, "Something went wrong")
    }
    
    func testAuthenticateWithAuthorizedUser() {
        loginViewModel.email = "user@email.com"
        loginViewModel.password = "password"
        loginViewModel.authenticate()
        
        XCTAssert(loginViewModel.shouldNavigate, "Something went wrong")
    }
}
