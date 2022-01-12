//
//  PostTableViewCell.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import UIKit

class PostCollectionViewCell:
    
    UICollectionViewCell,
    FillableCell {
    
    typealias DataType = PostEntity
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var autorNameLabel: UILabel!
    @IBOutlet weak var autorImageView: UIImageView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    func fill(with data: PostEntity) {
        
        self.autorNameLabel.text = "By \(data.owner?.firstName ?? "")"
        
        if let autorPicUrlStr = data.owner?.picture {
            if let autorPicUrl = URL(string: autorPicUrlStr) {
                self.autorImageView?.load(url: autorPicUrl) { image in
                    image?.makeRounded()
                }
            }
        }
        
        if let postPicUrlStr = data.image {
            if let postPicUrl = URL(string: postPicUrlStr) {
                self.postImageView?.load(url: postPicUrl) { image in
                    image?.isHidden = false
                    self.progressIndicator.isHidden = true
                }
            }
        }
    }
}
