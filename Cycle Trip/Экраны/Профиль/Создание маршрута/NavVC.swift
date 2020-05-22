//
//  NavVC.swift
//  MapTesting
//
//  Created by Igor Lebedev on 19/05/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit

class NavVC: UINavigationController {
    var tableVC: TableVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVC = TableVC()
        tableVC.title = "Создать"
        viewControllers = [tableVC]
        tableVC.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped(sender:)))
        tableVC.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(cancelTapped(sender:)))
        
        
        // Do any additional setup after loading the view.
    }
    @objc func cancelTapped(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
