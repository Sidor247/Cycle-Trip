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
        modalTransitionStyle = .flipHorizontal
        modalPresentationStyle = .fullScreen
        let viewController = ViewController()
        let chatVC = ChatVC()
        let mapController = MapController()
        viewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person") , selectedImage: UIImage(systemName: "person.fill"))
        mapController.tabBarItem = UITabBarItem(title: "Карта", image: UIImage(systemName: "map") , selectedImage: UIImage(systemName: "map.fill"))
        chatVC.tabBarItem = UITabBarItem(title: "Чат", image: UIImage(systemName: "message") , selectedImage: UIImage(systemName: "message.fill"))
        viewControllers = [chatVC, mapController, viewController]
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
