//
//  UserDetailViewController.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import UIKit

/**
 * User detail view
 * TODO: Presenter, etc. Fetch full user data and present more info. Fetch user posts and show un a list under the user info
 */
class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user: UserEntity?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.nameLabel.text = user?.formatFullName()
        self.emailLabel.text = user?.email
        
        if let urlString = user?.picture {
            if let userPicUrl = URL(string: urlString) {
                self.userImageView?.load(url: userPicUrl)  { image in
                    image?.makeRounded()
                }
            }
        }
    }
}
