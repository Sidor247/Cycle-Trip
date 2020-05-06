//
//  AuthenticationView.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 19.04.2020.
//  Copyright © 2020 Гусейн Агаев. All rights reserved.
//

import UIKit
import PinLayout

class AuthenticationView: UIViewController, AuthScreenView {
    
    var presenter: AuthScreenViewPresenter?
    
    let labelProgramName = UILabel()
        
    let emailField = CustomTextField(name: "Email", color: 0xEBEBEB, security: false)
    let passwordField = CustomTextField(name: "Пароль", color: 0xEBEBEB, security: true)
        
    let buttonSignIn = CustomButton(color: 0xFFFFFF, background: 0x4680C2, title: "Войти")
    let buttonSignUp = CustomButton(color: 0x4680C2, background: 0xFFFFFF, title: "Зарегистрироваться")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        labelProgramName.text = "Cycle Trip"
        labelProgramName.font = UIFont(name: "Arial", size: 50)
        labelProgramName.textColor = CustomColor(0x4680C2)
        
        emailField.returnKeyType = .next
        passwordField.returnKeyType = .go
        
        emailField.addTarget(passwordField, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        passwordField.addTarget(buttonSignIn, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        
        buttonSignIn.addTarget(self, action: #selector(didTapButtonSignIn), for: .touchUpInside)
        buttonSignUp.addTarget(self, action: #selector(didTapButtonSignUp), for: .touchUpInside)
                
        [labelProgramName, emailField, passwordField, buttonSignIn, buttonSignUp].forEach {
            view.addSubview($0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
        labelProgramName.pin
            .top(view.pin.safeArea.top + 50)
            .hCenter()
            .sizeToFit()
            
        emailField.pin
            .vCenter(-100)
            .horizontally(20)
            .height(45)
                
        passwordField.pin
            .vCenter(-50)
            .horizontally(20)
            .height(45)
                
        buttonSignIn.pin
            .vCenter()
            .height(40)
            .horizontally(20)
        
        buttonSignUp.pin
            .bottom(view.pin.safeArea.bottom + 30)
            .height(20)
            .horizontally(40)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setState(transation: Bool) {
        let tabBar = TabBar()
        
        buttonSignIn.loadingStop()
        buttonSignIn.isEnabled = true
        buttonSignUp.isEnabled = true
        
        if transation == true {
            self.present(tabBar, animated: true, completion: nil)
        }
    }
    
    @objc func didTapButtonSignIn() {
        guard let email = emailField.text, let password = passwordField.text else {
            return
        }
        
        buttonSignIn.loadingStart()
        buttonSignIn.isEnabled = false
        buttonSignUp.isEnabled = false
        
        presenter = AuthPresenter(view: self, email: email, password: password)
        self.presenter?.showState()
    }
        
    @objc func didTapButtonSignUp() {
        let regView = RegistrationView()
        
        regView.modalTransitionStyle = .crossDissolve
        regView.modalPresentationStyle = .overCurrentContext
        self.present(regView, animated: true, completion: nil)
    }
}
