//
//  KataAppTests.swift
//  KataLoginLogoutSwiftTests
//
//  Created by jesus.martinez on 20/9/18.
//  Copyright © 2018 JML. All rights reserved.
//

import XCTest
@testable import KataLoginLogoutSwift

class KataAppTests: XCTestCase {
    
    var sut: KataApp!
    let fakeClock = FakeClock()
    
    override func setUp() {
        super.setUp()

        sut = KataApp(clock: fakeClock)
    }
    
    func test_givenAdminAdmin_whenICallValidate_thenReturnTrue() {
        
        // given
        
        // when
        let result = sut.validate(user: "admin", password: "admin")
        
        // then
        XCTAssertTrue(result == true)
    }
    
    func test_givenAdminXXX_whenICallValidate_thenReturnFalse() {
        
        // given
        
        // when
        let result = sut.validate(user: "admin", password: "XXX")
        
        // then
        XCTAssertTrue(result == false)
    }
    
    func test_givenXXXAdmin_whenICallValidate_thenReturnTrue() {
        
        // given
        
        // when
        let result = sut.validate(user: "XXX", password: "admin")
        
        // then
        XCTAssertTrue(result == false)
    }
    
    func test_givenXXXAndXXX_whenICallValidate_thenReturnTrue() {
        
        // given
        
        // when
        let result = sut.validate(user: "XXX", password: "XXX")
        
        // then
        XCTAssertTrue(result == false)
    }
    
    
    func test_givenTimestampOdd_whenICallValidLogout_thenReturnFalse() {
        
        // given
        fakeClock.dummyDate = Date(timeIntervalSince1970: 3)
        
        // when
        let result = sut.validLogout()

        // then
        XCTAssertTrue(result == false)
    }
    
    func test_givenTimestampEven_whenICallValidLogout_thenReturnTrue() {
        
        // given
        fakeClock.dummyDate = Date(timeIntervalSince1970: 2)

        // when
        let result = sut.validLogout()
        
        // then
        XCTAssertTrue(result == true)
    }
    
    func test_givenUserWithoutDotsCommasAndSemicolons_whenICallValidateUser_thenReturnTrue() {
        
        // given
        
        // when
        let result = sut.validate(user: "admin")
        
        // then
        XCTAssertTrue(result == true)
    }
    
    func test_givenUserWithDotAndWithoutCommasAndSemicolons_whenICallValidateUser_thenReturnFalse() {
        
        // given
        
        // when
        let result = sut.validate(user: "admin.")
        
        // then
        XCTAssertTrue(result == false)
    }
    
    func test_givenUserWithCommaAndWithoutDotsAndSemicolons_whenICallValidateUser_thenReturnFalse() {
        
        // given
        
        // when
        let result = sut.validate(user: "ad,min")
        
        // then
        XCTAssertTrue(result == false)
    }
    
    func test_givenUserWithSemicolonAndWithoutDotsAndCommas_whenICallValidateUser_thenReturnFalse() {
        
        // given
        
        // when
        let result = sut.validate(user: ";admin")
        
        // then
        XCTAssertTrue(result == false)
    }
}

class FakeClock: Clock {
    
    var dummyDate: Date!
    
    override var now: Date {
        return dummyDate
    }
}
