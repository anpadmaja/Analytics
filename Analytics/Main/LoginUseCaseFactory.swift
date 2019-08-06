//
//  LoginUseCaseFactory.swift
//  Analytics
//
//  Created by padmaja adhyam nagarajan on 8/5/19.
//  Copyright © 2019 PayPal Inc. All rights reserved.
//

import Foundation

class LoginUseCaseFactory {
    
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer([
            LoginPresenterViewModel(),
            CrashlyticsLoginTracker(),
            FirebaseLoginTracker()
            ]))
    }
}
