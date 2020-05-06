//
//  AuthPresenter.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 24.04.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import Foundation
import Firebase

protocol AuthScreenView: class {
    func setState(transation: Bool)
}

protocol AuthScreenViewPresenter {
    init(view: AuthScreenView, email: String, password: String)
    func showState()
}

class AuthPresenter: AuthScreenViewPresenter {
    
    unowned let view: AuthScreenView
    let password: String
    let email: String
    
    required init(view: AuthScreenView, email: String, password: String) {
        self.password = password
        self.email = email
        self.view = view
    }
    
    func showState() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            guard error == nil, user != nil else {
                self?.view.setState(transation: false)
                print("Error")
                return
            }
            
            self?.view.setState(transation: true)
        }
    }
}

