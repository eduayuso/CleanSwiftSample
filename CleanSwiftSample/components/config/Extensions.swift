//
//  Extensions.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import UIKit
import Moya

/**
 * Load async an image from a url
 */
extension UIImageView {
    
    func load(url: URL, onComplete:@escaping (UIImageView?) -> Void) {
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        onComplete(self)
                    }
                }
            }
        }
    }
    
    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

/**
 * Extension of the Target Type (Moya) for common configuration
 */
extension TargetType {
    
    var baseURL: URL {
        
        return URL(string: AppConstants.API_URL)!
    }
    
    var headers: [String : String]? {
        
        let heads = [
            AppConstants.API_APP_ID_KEY: AppConstants.API_APP_ID_VALUE
        ]
        return heads
    }
}

/**
 *
 */

