//
//  UserTableViewCell.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import UIKit

class UserTableViewCell:
                            
    UITableViewCell,
    FillableCell {
    
    typealias DataType = UserEntity
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    func fill(with data: UserEntity) {
        
        self.userNameLabel.text = "\(data.firstName ?? "") \(data.lastName ?? "")"
        self.userEmailLabel.text = data.title // FIXME fill with email
        
        if let urlString = data.picture {
            if let userPicUrl = URL(string: urlString) {
                self.userImageView?.load(url: userPicUrl)  { _ in /* loaded */ }
            }
        }
    }
}
