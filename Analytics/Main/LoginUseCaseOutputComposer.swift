//
//  LoginUseCaseOutputComposer.swift
//  Analytics
//
//  Created by padmaja adhyam nagarajan on 8/5/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import Foundation

class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSucceeded() {
        outputs.forEach{ $0.loginSucceeded() }
    }
    
    func loginFailed() {
        outputs.forEach{ $0.loginFailed() }
    }
}
