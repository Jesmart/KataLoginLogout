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
    
    override func setUp() {
        super.setUp()

        sut = KataApp()
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
    
}
