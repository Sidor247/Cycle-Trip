//
//  CustomCell.swift
//  MapTesting
//
//  Created by Igor Lebedev on 21/05/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit
import PinLayout
class CustomCell: UITableViewCell {
    var icon: UIImageView = {
       let imgView = UIImageView()
       imgView.contentMode = .scaleAspectFit
       imgView.clipsToBounds = true
       return imgView
    }()
    
    var textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        return tf
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon)
        contentView.addSubview(textField)
        icon.pin.centerLeft(10).size(30)
        textField.pin.after(of: icon, aligned: .center).right().height(40).marginHorizontal(10)
    }
    func myCell(placeholder: String, iconName: String, input: UIView?, toolbar: UIToolbar?) {
        icon.image = UIImage(systemName: iconName)
        textField.placeholder = placeholder
        if let input = input {
            textField.inputView = input }
        if let toolbar = toolbar {
            textField.inputAccessoryView = toolbar
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
}
