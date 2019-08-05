//
//  LoginUseCase.swift
//  Analytics
//
//  Created by padmaja adhyam nagarajan on 8/5/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceeded()
    func loginFailed()
}

final class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    
    func login(name: String, password: String) {
        output.loginSucceeded()
    }
}
