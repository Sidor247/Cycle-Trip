//
//  TabBar.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 21/04/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .coverVertical
        modalPresentationStyle = .fullScreen
        viewControllers = [ChatVC(), MapController(), ViewController()]
        selectedIndex = 1

        // Do any additional setup after loading the view.
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
