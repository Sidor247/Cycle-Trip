//
//  AnimatedPresenter.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 10.05.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import Foundation
import Firebase

protocol AnimatedScreenView: class {
    func authorizationСheck(data: Bool)
}

protocol AnimatedScreenPresenter {
    init(view: AnimatedScreenView)
    func dataProcessing()
}

class AnimatedPresenter: AnimatedScreenPresenter {

    unowned let view: AnimatedScreenView
    
    required init(view: AnimatedScreenView) {
        self.view = view
    }
    
    func dataProcessing() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.view.authorizationСheck(data: true)
                return

            } else {
                self.view.authorizationСheck(data: false)
                return
            }
        }
    }
}
