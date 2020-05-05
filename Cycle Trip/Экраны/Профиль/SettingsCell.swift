//
//  SettingsCell.swift
//  Cycle Trip
//
//  Created by AVK on 04.05.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit

//@available(iOS 13.0, *)
class SettingsCell: UITableViewCell {
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else {return }
            textLabel?.text = sectionType.description
            switchControl.isHidden = !sectionType.containsSwitch
        }
    }
    
    lazy var switchControl: UISwitch = {
        let swithControl = UISwitch()
        let a = ViewController() .UIColorFromRGB(rgbValue: 0x4680C2)
        swithControl.isOn = true
        swithControl.onTintColor = a
        swithControl.translatesAutoresizingMaskIntoConstraints = false
        swithControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return swithControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(switchControl)
        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwitchAction(sender: UISwitch){
        if sender.isOn{
            print("Turned on")
        }
        else {
            print("Turned off")
        }
}
}

