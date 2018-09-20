//
//  KataPresenterTests.swift
//  KataLoginLogoutSwiftTests
//
//  Created by jesus.martinez on 20/9/18.
//  Copyright © 2018 JML. All rights reserved.
//

import XCTest
@testable import KataLoginLogoutSwift

class KataPresenterTests: XCTestCase {
    
    var sut: KataPresenter!
    var dummyView: DummyView!
    var dummyKata: DummyKata!
    
    override func setUp() {
        
        dummyView = DummyView()
        dummyKata = DummyKata()
        
        sut = KataPresenter(view: dummyView, kataApp: dummyKata)
    }
    
    // MARK: - didTapLoginButton
    
    
    func test_givenKataAppThatReturnValidateUserFalse_whenICallDidTapLoginButton_thenICallShowError() {
        
        // given
        dummyKata.dummyValidUser = false

        // when
        sut.didTapLoginButton(user: "Any", password: "Any")
        
        // then
        XCTAssert(dummyView.isCalledShowError == true)
    }
    
    func test_givenKataAppThatReturnValidateUserFalse_whenICallDidTapLoginButton_thenICallShowErrorWithAppropiateTitle() {
        
        // given
        dummyKata.dummyValidUser = false

        // when
        sut.didTapLoginButton(user: "Any", password: "Any")

        // then
        XCTAssert(dummyView.error == "Invalid user")
    }
    
    func test_givenKataAppThatReturnValidateUserTrueButValidateUserPasswordReturnFalse_whenICallDidTapLoginButton_thenICallShowError() {
        
        // given
        dummyKata.dummyValidUser = true
        dummyKata.dummyValidLogin = false
        
        // when
        sut.didTapLoginButton(user: "Any", password: "Any")
        
        // then
        XCTAssert(dummyView.isCalledShowError == true)
    }
    
    func test_givenKataAppThatReturnValidateUserTrueButValidateUserPasswordReturnFalse_whenICallDidTapLoginButton_thenICallShowErrorWithAppropiateTitle() {
        
        // given
        dummyKata.dummyValidUser = true
        dummyKata.dummyValidLogin = false
        
        // when
        sut.didTapLoginButton(user: "Any", password: "Any")
        
        // then
        XCTAssert(dummyView.error == "Invalid credentials")
    }
    
    func test_givenKataAppThatReturnValidateUserTrueButValidateUserPasswordReturnTrue_whenICallDidTapLoginButton_thenICallShowLogoutForm() {
        
        // given
        dummyKata.dummyValidUser = true
        dummyKata.dummyValidLogin = true
        
        // when
        sut.didTapLoginButton(user: "Any", password: "Any")
        
        // then
        XCTAssert(dummyView.isCalledShowLogoutForm == true)
    }
    
    func test_givenKataAppThatReturnValidateUserTrueButValidateUserPasswordReturnTrue_whenICallDidTapLoginButton_thenICallHideLoginForm() {
        
        // given
        dummyKata.dummyValidUser = true
        dummyKata.dummyValidLogin = true
        
        // when
        sut.didTapLoginButton(user: "Any", password: "Any")
        
        // then
        XCTAssert(dummyView.isCalledHideLoginForm == true)
    }
    
    
    // MARK: - didTapLogoutButton
    
    func test_givenKataAppThatReturnValidLogoutFalse_whenICallDidTapLogoutButton_thenICallViewShowError() {
        
        // given
        dummyKata.dummyValidLogout = false
        
        // when
        sut.didTapLogoutButton()
        
        // then
        XCTAssert(dummyView.isCalledShowError == true)
    }
    
    func test_givenKataAppThatReturnValidLogoutFalse_whenICallDidTapLogoutButton_thenICallViewShowErrorWithAppropiateTitle() {
        
        // given
        dummyKata.dummyValidLogout = false

        // when
        sut.didTapLogoutButton()

        // then
        XCTAssert(dummyView.error == "Logout error")
    }
    
    func test_givenKataAppThatReturnValidLogoutTrue_whenICallDidTapLogoutButton_thenICallViewHideLogout() {
        
        // given
        dummyKata.dummyValidLogout = true
        
        // when
        sut.didTapLogoutButton()
        
        // then
        XCTAssert(dummyView.isCalledHideLogoutForm == true)
    }
    
    func test_givenKataAppThatReturnValidLogoutTrue_whenICallDidTapLogoutButton_thenICallViewShowLoginForm() {
        
        // given
        dummyKata.dummyValidLogout = true
        
        // when
        sut.didTapLogoutButton()
        
        // then
        XCTAssert(dummyView.isCalledShowLoginForm == true)
    }
}

class DummyView: View {
    
    var error: String?
    
    var isCalledShowError = false
    var isCalledShowLoginForm = false
    var isCalledHideLoginForm = false
    var isCalledShowLogoutForm = false
    var isCalledHideLogoutForm = false

    
    func showError(title: String) {
        isCalledShowError = true
        
        error = title
    }
    
    func showLoginForm() {
        isCalledShowLoginForm = true
    }
    
    func hideLoginForm() {
        isCalledHideLoginForm = true
    }
    
    func showLogoutForm() {
        isCalledShowLogoutForm = true
    }
    
    func hideLogoutForm() {
        isCalledHideLogoutForm = true
    }
}

class DummyKata: KataApp {
    
    var dummyValidLogin = false
    var dummyValidLogout = false
    var dummyValidUser = false
    
    init() {
        super.init(clock: Clock())
    }
    
    override func validate(user: String, password: String) -> Bool {
        
        return dummyValidLogin
    }
    
    override func validLogout() -> Bool {
        
        return dummyValidLogout
    }
    
    override func validate(user: String) -> Bool {
        
        return dummyValidUser
    }
}
