//
//  UserListViewController.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import UIKit
import Swinject

/**
 * It could also be a UITableViewController, but we could need add more components in this view, not only a table. So this way it's more flexible.
 * TODO: Prefetching
 */
class UserListViewController:
                   
    UIViewController,
    PresentableView,
    UITableViewDelegate,
    UITableViewDataSource {
    
    let DEFAULT_TABLE_CELL_HEIGHT: CGFloat = 68.0
    
    typealias PresenterType = UserListPresenterProtocol
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter: UserListPresenterProtocol = {
        
        var presenter = DIConfig.container.resolve(UserListPresenterProtocol.self)!
        presenter.listener = self
        return presenter
    }()
    
    var userList: [UserEntity] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let cellId = AppConstants.USER_TABLE_VIEW_CELL_ID
        let bundle = Bundle(for: type(of: self))
        let cellNib = UINib(nibName: cellId, bundle: bundle)
        self.tableView.accessibilityIdentifier = AppConstants.USERS_TABLE_VIEW_ID // For testing purposes
        self.tableView.register(cellNib, forCellReuseIdentifier: cellId)
    }
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        self.presenter.fetchUsers()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.USER_TABLE_VIEW_CELL_ID, for: indexPath) as! UserTableViewCell
        cell.accessibilityIdentifier = "\(AppConstants.USER_TABLE_VIEW_CELL_ID)_\(indexPath.item)" // For testing purposes
        cell.isAccessibilityElement = true
        
        let user = self.userList[indexPath.item]
        cell.fill(with: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        self.DEFAULT_TABLE_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let segueId = "ShowUserDetailSegue"
        self.selectedUser = self.userList[indexPath.item]
        self.performSegue(withIdentifier: segueId, sender: nil)
    }
    
    private var selectedUser: UserEntity?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let userDetailVC = segue.destination as? UserDetailViewController {
            
            userDetailVC.user = selectedUser!
        }
    }
}

extension UserListViewController: UserListEvents {
    
    func onUserListFetched(users: [UserEntity]) {
        
        self.userList = users
        self.tableView.reloadData()
    }
    
    func onServerError(message: String) {
        
        let alert = UIAlertController(title: "Server error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
