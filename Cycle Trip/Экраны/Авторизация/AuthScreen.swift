//
//  ViewController.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 19.04.2020.
//  Copyright © 2020 Гусейн Агаев. All rights reserved.
//

import UIKit
import PinLayout
import Firebase

class AuthScreen: UIViewController {
    
    var delegate: User? = nil
    
    let labelProgramName = UILabel()
    let login = CustomTextField(name: "Логин", color: 0xEBEBEB, security: false)
    let password = CustomTextField(name: "Пароль", color: 0xEBEBEB, security: true)
        
    let buttonSignIn = CustomButton(color: 0xFFFFFF, background: 0x4680C2, title: "Войти")
    let buttonSignUp = CustomButton(color: 0x4680C2, background: 0xFFFFFF, title: "Зарегистрироваться")
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        labelProgramName.text = "Cycle Trip"
        labelProgramName.font = UIFont(name: "Arial", size: 50)
        labelProgramName.textColor = UIColorFromRGB(0x4680C2)
            
        buttonSignIn.addTarget(self, action: #selector(didTapButtonSignIn), for: .touchUpInside)
        buttonSignUp.addTarget(self, action: #selector(didTapButtonSignUp), for: .touchUpInside)
                
        [labelProgramName, login, password, buttonSignIn, buttonSignUp].forEach {
            view.addSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
        labelProgramName.pin
            .top(view.pin.safeArea.top + 50)
            .hCenter()
            .sizeToFit()
            
        login.pin
            .vCenter(-100)
            .horizontally(20)
            .height(45)
                
        password.pin
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
    
    func setState(data: String) {
        print("\(data) 01")
    }
    
    @objc func didTapButtonSignIn() {
        guard let login = login.text, let pass = password.text, login != "", pass != ""
            else { print("Empty textfields")
                    return }
        Auth.auth().signIn(withEmail: login, password: pass) { [weak self] user, error in
            if error != nil {
                print("Error")
                return
            }
            if user != nil {
                self!.dismiss(animated: true, completion: nil)
                return }
            print("No such user")
        }


    }
        
    @objc func didTapButtonSignUp() {
    //  let tableViewController = TableViewController()
    //
    //  present(tableViewController, animated: true, completion: nil)
        guard let login = login.text, let pass = password.text, login != "", pass != ""
        else { print("Empty textfields")
                return }
        Auth.auth().createUser(withEmail: login, password: pass) { [weak self] user, error in
            if error != nil {
                print("Error")
                return
            }
            if user != nil {
                self!.dismiss(animated: true, completion: nil)
            }
        }
    }

    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

