//
//  StartAnimation.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 21/04/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit
import Firebase
import PinLayout
import CoreData

class StartView: UIViewController {
    let label = UILabel()
    var loggedIn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        label.font = UIFont(name: "San Francisco", size: 50)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Анимация"
        view.addSubview(label)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.loggedIn = true
                return }
            else { self.loggedIn = false
                   return }
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {

            if self.loggedIn {
            let tabBar = TabBar()
            self.present(tabBar, animated: true, completion: nil) }
        else {
            let authScreen = AuthenticationView()
            authScreen.modalPresentationStyle = .fullScreen
            self.present(authScreen, animated: true, completion: nil) }
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.pin
            .vCenter()
            .hCenter()
            .sizeToFit()
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
