//
//  Chat.swift
//  Cycle Trip
//
//  Created by Vladimir Ovsiannikov on 30.05.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import Foundation
import Firebase
struct Chat {
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        return formatter
    }()
    var name: String
    var date: Date
    var messages: NSArray
    let ref: DatabaseReference = Database.database().reference().child("chats")
    
    init(name: String, date: Date) {
        self.name = name
        self.date = date
        self.messages = []
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String : Any]
        self.name = snapshotValue["name"] as! String
        self.date = formatter.date(from: (snapshotValue["date"] as! String))!
        self.messages = snapshotValue["messages"] as! NSArray
    }
    func uploadChat() {
       
      let dictionary = ["name":name,"date":formatter.string(from: date)] as [String : Any]
       ref.child(name).setValue(dictionary)
    }

    
}
