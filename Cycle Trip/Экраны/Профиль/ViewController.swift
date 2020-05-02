import UIKit
import PureLayout


class ViewController: UIViewController {
    
    let profileView = ProfileView(frame: .zero)
    
    //private let networkManager: NetworkManagerDescription = NetworkManager.shared
    //private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person") , selectedImage: UIImage(systemName: "person.fill"))
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .white
        self.view.addSubview(self.profileView)
        self.profileView.autoPinEdgesToSuperviewEdges()
          self.view.layoutIfNeeded()
    }
}


