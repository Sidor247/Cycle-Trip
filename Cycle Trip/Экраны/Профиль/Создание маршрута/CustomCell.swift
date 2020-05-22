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
    
    var formatter: DateFormatter!
    
    var picker: UIDatePicker!
    
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
    
    func myCell(placeholder: String, iconName: String, picker: UIDatePicker?, format: String?) {
        icon.image = UIImage(systemName: iconName)
        textField.placeholder = placeholder
        if picker != nil {
            self.picker = picker
            textField.inputView = picker
            self.picker.addTarget(self, action: #selector(valueChanged(sender:)), for: .valueChanged)
        }
        if format != nil {
            formatter = DateFormatter()
            formatter.dateFormat = format
        }
        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func valueChanged(sender:UIDatePicker) {
        textField.text = formatter.string(from: sender.date)
    }
        
}
