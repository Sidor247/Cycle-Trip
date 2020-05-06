//
//  RegPresenter.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 05.05.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import Foundation
import Firebase

protocol RegScreenView: class {
    func setState(transation: Bool)
}

protocol RegScreenViewPresenter {
    init(view: RegScreenView, email: String, password: String, lastName: String, firstName: String)
    func showState()
}

class RegPresenter: RegScreenViewPresenter {
    
    var user: User!
    var ref: DatabaseReference!
    
    unowned let view: RegScreenView
    
    required init(view: RegScreenView, email: String, password: String, lastName: String, firstName: String) {
        self.user = User(email: email, password: password, lastName: lastName, firstName: firstName)
        self.view = view
    }
    
    func showState() {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (user, error) in
            guard error == nil, user != nil else {
                self.view.setState(transation: false)
                return
            }

            guard let uid = user?.user.uid else {
                return
            }
            
            Database.database().reference().child("users").child(uid).updateChildValues(self.user.convertToDictionary()) { (error, ref) in
               guard error == nil else {
                    self.view.setState(transation: false)
                    return
                }
                
                self.view.setState(transation: true)
            }
        }
    }
}
