//
//  Person.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 24.04.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let email: String
    let password: String
    let lastName: String
    let firstName: String
    let imageURL: String?
    
    init(email: String, password: String, lastName: String, firstName: String, imageURL: String?) {
        self.email = email
        self.password = password
        self.lastName = lastName
        self.firstName = firstName
        self.imageURL = imageURL
    }

    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        email = snapshotValue["email"] as! String
        password = snapshotValue["password"] as! String
        lastName = snapshotValue["lastName"] as! String
        firstName = snapshotValue["firstName"] as! String
        imageURL = snapshotValue["imageURL"] as? String
    }
    
    func convertToDictionary() -> [AnyHashable : Any] {
        return ["email": email, "lastName": lastName, "firstName": firstName, "imageURL": imageURL as Any]
    }
}
