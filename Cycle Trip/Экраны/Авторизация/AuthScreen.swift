//
//  ViewController.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 19.04.2020.
//  Copyright © 2020 Гусейн Агаев. All rights reserved.
//

import UIKit
import PinLayout

class AuthScreen: UIViewController {
    
    let backgroundScreen = BackgroundView()
    
    let labelProgramName = UILabel()
    let labelPassword = UILabel()
    let labelLogin = UILabel()
    
    let password = UITextField()
    let login = UITextField()
    
    let buttonSignUp = UIButton()
    let buttonSignIn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .coverVertical
        modalPresentationStyle = .fullScreen
        labelProgramName.font = UIFont(name: "Snell Roundhand", size: 50)
        labelProgramName.textAlignment = .center
        labelProgramName.textColor = .white
        labelProgramName.text = "Cycle Trip"
        
        labelLogin.textColor = .white
        labelLogin.font = UIFont(name: "Snell Roundhand", size: 30)
        labelLogin.textAlignment = .left
        labelLogin.textColor = .white
        labelLogin.text = "Login:"
        
        labelPassword.font = UIFont(name: "Snell Roundhand", size: 30)
        labelPassword.textAlignment = .left
        labelPassword.textColor = .white
        labelPassword.text = "Password:"
        
        password.backgroundColor = .white
        password.layer.cornerRadius = 8
        password.isSecureTextEntry = true
        password.textContentType = .password
        password.font = UIFont.systemFont(ofSize: 14)
        
        login.backgroundColor = .white
        login.layer.cornerRadius = 8
        login.textContentType = .nickname
        login.font = UIFont.systemFont(ofSize: 14)
        
        buttonSignIn.isEnabled = true
        buttonSignIn.backgroundColor = .orange
        buttonSignIn.layer.cornerRadius = 8
        buttonSignIn.setTitle("Sing in", for: .normal)
        buttonSignIn.addTarget(self, action: #selector(didTapButtonSignIn), for: .touchUpInside)
        
        buttonSignUp.isEnabled = true
        buttonSignUp.backgroundColor = .orange
        buttonSignUp.layer.cornerRadius = 8
        buttonSignUp.setTitle("Sign up", for: .normal)
        buttonSignUp.addTarget(self, action: #selector(didTapButtonSignUp), for: .touchUpInside)
        
        [backgroundScreen, labelProgramName, labelLogin, labelPassword, password, login, buttonSignUp, buttonSignIn].forEach {
            view.addSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundScreen.pin.all()
        
        labelProgramName.pin
            .top(view.pin.safeArea.top + 50)
            .hCenter()
            .sizeToFit()
        
        labelLogin.pin
            .vCenter(-100)
            .left(20)
            .right(UIScreen.main.bounds.width / 2 + 10)
            .sizeToFit(.width)
        
        labelPassword.pin
            .vCenter(-60)
            .left(20)
            .right(UIScreen.main.bounds.width / 2 + 10)
            .sizeToFit(.width)
        
        login.pin
            .vCenter(-100)
            .right(20)
            .left(UIScreen.main.bounds.width / 2 + 10)
            .sizeToFit(.width)
        
        password.pin
            .vCenter(-60)
            .right(20)
            .left(UIScreen.main.bounds.width / 2 + 10)
            .sizeToFit(.width)
        
        buttonSignIn.pin
            .vCenter(-20)
            .right(20)
            .left(UIScreen.main.bounds.width / 2 + 10)
            .sizeToFit(.width)
            
        
        buttonSignUp.pin
            .vCenter(-20)
            .left(20)
            .right(UIScreen.main.bounds.width / 2 + 10)
            .sizeToFit(.width)
    }


    @objc private func didTapButtonSignIn() {
        let tabBar = TabBar()
        present(tabBar, animated: true, completion: nil)
    }
    
    @objc private func didTapButtonSignUp() {
//        let tableViewController = TableViewController()
//        
//        present(tableViewController, animated: true, completion: nil)
        print("\(#function)")
    }
}
