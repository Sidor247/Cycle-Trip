//
//  NetworkManager.swift
//  Cycle Trip
//
//  Created by Гусейн Агаев on 04.05.2020.
//  Copyright © 2020 Прогеры. All rights reserved.
//

//import Foundation
//import Firebase
//
//protocol NetworkManagerDescription {
//    func loadPosts(completion: (([Person]?) -> Void)?)
//}
//
//final class NetworkManager: NetworkManagerDescription {
//    static let shared = NetworkManager()
//
//    let baseURL = "https://cycle-trip-e00f5.firebaseio.com"
//
//    private init() {}
//
//    func loadPosts(completion: (([Person]?) -> Void)?) {
//        let urlString = "\(baseURL)/Person/BDOa4Wik4eI95uz0WMjS"
//        guard let url = URL(string: urlString) else {
//            completion?(nil)
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                completion?(nil)
//                return
//            }
//            
//            guard let data = data else {
//                completion?(nil)
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                let posts = try decoder.decode([Person].self, from: data)
//                completion?(posts)
//            } catch let error {
//                print(error.localizedDescription)
//                completion?(nil)
//            }
//        }.resume()
//    }
//}


//    func inputError() {
//        let alertController = UIAlertController(title: "Ошибка ввода",
//                                                message: "Пароль или логин введен не верно",
//                                                preferredStyle: .alert)
//        alertController.addTextField()
//        let save = UIAlertAction(title: "Save", style: .default) { _ in
//            guard let textField = alertController.textFields?.first, textField.text != "" else { return }
//        }
//
//        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//        alertController.addAction(save)
//    }



        
//        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)

//    @objc func kbDidShow(notification: Notification) {
//        guard let userInfo = notification.userInfo else {
//            return
//        }
//        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
//
//        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
//    }
//
//    @objc func kbDidHide() {
//        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
//    }



//    func textViewDidEndEditing(_ textView: UITextView) {
//        textView.resignFirstResponder()
//    }
