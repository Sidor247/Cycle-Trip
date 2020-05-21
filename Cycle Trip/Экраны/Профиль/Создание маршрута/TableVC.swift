//
//  TableVC.swift
//  Cycle Trip
//
//  Created by Igor Lebedev on 19/05/2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {
    var eventDate = NSDate.now
    let dateFormatter = DateFormatter()
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        dp.minimumDate = NSDate.now
        dp.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        return dp
    }()
    let timePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time
        dp.minimumDate = NSDate.now
        return dp
    }()
    let toolbar: UIToolbar = {
        let tb = UIToolbar()
        tb.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        tb.setItems([flexibleSpace, doneButton], animated: true)
        return tb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @objc func doneAction() {
        view.endEditing(true)
    }
    
    @objc func valueChanged() {
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        switch indexPath.row {
            case 0:
                cell.myCell(placeholder: "Название", iconName: "pencil" , input: nil, toolbar: nil)
        
            case 1:
                dateFormatter.dateFormat = "E, d MMM yyyy"
                cell.myCell(placeholder: dateFormatter.string(from: eventDate), iconName: "calendar" , input: datePicker, toolbar: toolbar)
            case 2:
                dateFormatter.dateFormat = "HH:mm"
                cell.myCell(placeholder: dateFormatter.string(from: eventDate), iconName: "clock" , input: timePicker, toolbar: toolbar)
            default:
                print("ы")
        }
        return cell
    }
//    func createCells() -> [UITableViewCell] {
//        let date = UITableViewCell(style: ., reuseIdentifier: <#T##String?#>)
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


}
