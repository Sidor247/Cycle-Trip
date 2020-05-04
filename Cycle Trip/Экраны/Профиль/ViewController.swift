import UIKit
import PureLayout


class ViewController: UIViewController {
    
    let profileView = ProfileView(frame: .zero)
    
    //private let networkManager: NetworkManagerDescription = NetworkManager.shared
    //private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .white
        self.view.addSubview(self.profileView)
        self.profileView.autoPinEdgesToSuperviewEdges()
          self.view.layoutIfNeeded()
    }
    
}


