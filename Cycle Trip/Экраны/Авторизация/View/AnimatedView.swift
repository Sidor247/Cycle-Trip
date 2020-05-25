//
//  AnimatedAnimation.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 21/04/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//


import UIKit
import Firebase
import PinLayout
import CoreData

class AnimatedView: UIViewController {

    private let imageView = UIImageView()
    private let label = UILabel()
    private var loggedIn = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        label.text = "Cycle Trip"
        label.font = UIFont(name: "Arial", size: 50)
        label.textColor = CustomColor(0x4680C2)
        
        view.addSubview(label)
        view.addSubview(imageView)
        
        animatedShow()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.pin
            .center()
            .height(80)
            .width(80)
        
        label.pin
            .top(view.pin.safeArea.top + 50)
            .hCenter()
            .sizeToFit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.loggedIn = false
                return

            } else {
                self.loggedIn = false
                return
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            if self.loggedIn {
                let tabBar = TabBar()
                self.present(tabBar, animated: true, completion: nil)
            } else {
                let authScreen = AuthenticationView()
                authScreen.modalTransitionStyle = .crossDissolve
                authScreen.modalPresentationStyle = .overCurrentContext
                self.present(authScreen, animated: true, completion: nil)
            }
        }
    }
    
    private func animatedShow() {
        imageView.image = UIImage(named: "Icon")
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
            
        let vector = CGVector(dx: UIScreen.main.bounds.width / 2, dy: 0)
        let parameters = SpringTimingParameters(damping: 0.5, response: 1.05, initialVelocity: vector)
        let animator = UIViewPropertyAnimator(duration: 3.0, timingParameters: parameters)
        var transform = CATransform3DIdentity
            
        animator.addAnimations {
            self.imageView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        }
        
        animator.addCompletion { _ in
            transform.m34 = -0.007
            self.imageView.layer.transform = transform
            UIView.animate(withDuration: 3) {
                self.imageView.layer.transform = CATransform3DRotate(transform, .pi, 0, 3, 3)
            }
        }
        
        animator.startAnimation()
    }
}
