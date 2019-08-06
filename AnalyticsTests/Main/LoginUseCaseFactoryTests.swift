//
//  LoginUseCaseFactoryTests.swift
//  AnalyticsTests
//
//  Created by padmaja adhyam nagarajan on 8/5/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import XCTest
@testable import Analytics

class LoginUseCaseFactoryTests: XCTestCase {

    func test_createdUseCase_hasComposedOutputs() {
        let sut = LoginUseCaseFactory()
        let useCase = sut.makeUseCase()
        XCTAssert(useCase.output is LoginUseCaseOutputComposer)
        
        let composer = useCase.output as? LoginUseCaseOutputComposer
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenterViewModel.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseLoginTracker.self), 1)
    }
}

extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter({ $0 is T }).count
    }
}
