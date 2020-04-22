//
//  ChatVC.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 21/04/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "Чат", image: nil , selectedImage: nil)
        view.backgroundColor = .blue
        label.font = UIFont(name: "San Francisco", size: 50)
        label.textAlignment = .center
        label.text = "Пили чат уёбак"
        view.addSubview(label)
        // Do any additional setup after loading the view.
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
