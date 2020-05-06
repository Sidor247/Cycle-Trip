//
//  RegistrationView.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 25.04.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit
import PinLayout

class RegistrationView: UIViewController, RegScreenView {

    var presenter: RegScreenViewPresenter?
    
    let titleName = UILabel()
    
    let backButton = CustomButton(color: 0x4680C2, background: 0xFFFFFF, title: "Вы уже зарегистрированы?")
    let continueButton = CustomButton(color: 0xFFFFFF, background: 0x4680C2, title: "Продолжить")
    
    let emailField = CustomTextField(name: "Email", color: 0xEBEBEB, security: false)
    let passwordField = CustomTextField(name: "Password", color: 0xEBEBEB, security: true)
    let lastNameField = CustomTextField(name: "Last name", color: 0xEBEBEB, security: false)
    let firstNameField = CustomTextField(name: "First name", color: 0xEBEBEB, security: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        titleName.text = "Регистрация"
        titleName.font = UIFont(name: "Arial", size: 50)
        titleName.textColor = CustomColor(0x4680C2)
        
        emailField.returnKeyType = .next
        lastNameField.returnKeyType = .next
        firstNameField.returnKeyType = .next
        passwordField.returnKeyType = .go
        
        lastNameField.autocapitalizationType = .sentences
        firstNameField.autocapitalizationType = .sentences
        
        emailField.addTarget(lastNameField, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        lastNameField.addTarget(firstNameField, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        firstNameField.addTarget(passwordField, action: #selector(becomeFirstResponder), for: .editingDidEndOnExit)
        
        backButton.addTarget(self, action: #selector(didTapButtonBack), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(didTapButtonContinue), for: .touchUpInside)
        
        [titleName, emailField, lastNameField, firstNameField, passwordField, continueButton, backButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        titleName.pin
            .top(view.pin.safeArea.top + 50)
            .hCenter()
            .sizeToFit()
        
        emailField.pin
            .vCenter(-100)
            .height(45)
            .horizontally(20)
                
        lastNameField.pin
            .vCenter(-50)
            .height(45)
            .horizontally(20)
                
        firstNameField.pin
            .vCenter()
            .height(45)
            .horizontally(20)

        passwordField.pin
            .vCenter(50)
            .height(45)
            .horizontally(20)
        
        continueButton.pin
            .vCenter(100)
            .height(40)
            .horizontally(20)
        
        backButton.pin
            .bottom(view.pin.safeArea.bottom + 30)
            .height(20)
            .horizontally(40)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setState(transation: Bool) {
        let tabBar = TabBar()

        backButton.isEnabled = true
        continueButton.isEnabled = true
        continueButton.loadingStop()
        
        if transation == true {
            self.present(tabBar, animated: true, completion: nil)
        }
    }
    
    @objc func didTapButtonContinue() {
        guard let email = emailField.text, let password = passwordField.text,
        let lastName = lastNameField.text, let firstName = firstNameField.text else {
            return
        }
        
        backButton.isEnabled = false
        continueButton.isEnabled = false
        continueButton.loadingStart()
        
        presenter = RegPresenter(view: self, email: email,
                                 password: password, lastName: lastName,
                                 firstName: firstName)
        
        self.presenter?.showState()
    }
    
    @objc func didTapButtonBack() {
        dismiss(animated: true, completion: nil)
    }
}
