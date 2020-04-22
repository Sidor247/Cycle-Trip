//
//  StartAnimation.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 21/04/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit


class StartAnimation: UIViewController {
    let loggedIn = false
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let authScreen = AuthScreen()
            self.present(authScreen, animated: true, completion: nil)
        }
        view.backgroundColor = .systemPink
        label.font = UIFont(name: "San Francisco", size: 50)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Анимация"
        view.addSubview(label)
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
