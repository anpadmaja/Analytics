//
//  LoginUseCaseOutputComposer.swift
//  AnalyticsTests
//
//  Created by padmaja adhyam nagarajan on 8/5/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import XCTest
@testable import Analytics

class LoginUseCaseOutputComposerTests: XCTestCase {

    func test_composingZeroOutput() {
        let t = LoginUseCaseOutputComposer([])
        t.loginSucceeded()
        t.loginFailed()
    }

    func testComposingOneOutput_delegateSucceeded() {
        let op1 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([op1])
        sut.loginSucceeded()
        XCTAssertEqual(op1.loginSuccessCount, 1)
        XCTAssertEqual(op1.loginFailedCount, 0)
    }
    
    func testComposingOneOutput_delegateFailed() {
        let op1 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([op1])
        sut.loginFailed()
        XCTAssertEqual(op1.loginSuccessCount, 0)
        XCTAssertEqual(op1.loginFailedCount, 1)
    }
    
    func testComposingMultipleOutput_delegateSucceeded() {
        let op1 = LoginUseCaseOutputSpy()
        let op2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([op1, op2])
        sut.loginSucceeded()
        XCTAssertEqual(op1.loginSuccessCount, 1)
        XCTAssertEqual(op1.loginFailedCount, 0)
        
        XCTAssertEqual(op2.loginSuccessCount, 1)
        XCTAssertEqual(op2.loginFailedCount, 0)
    }
    
    func testComposingMultipleOutput_delegateFailed() {
        let op1 = LoginUseCaseOutputSpy()
        let op2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([op1, op2])
        sut.loginFailed()
        XCTAssertEqual(op1.loginSuccessCount, 0)
        XCTAssertEqual(op1.loginFailedCount, 1)
        
        XCTAssertEqual(op2.loginSuccessCount, 0)
        XCTAssertEqual(op2.loginFailedCount, 1)
    }
    
    // MARK: Helpers
    class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        
        var loginSuccessCount:Int = 0
        var loginFailedCount:Int = 0
        
        func loginSucceeded() {
            loginSuccessCount += 1
        }
        
        func loginFailed() {
            loginFailedCount += 1
        }
        
    }

}
