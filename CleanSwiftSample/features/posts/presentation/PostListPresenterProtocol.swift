//
//  PostListPresenterProtocol.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

protocol PostListPresenterProtocol {
    
    var listener: PostListEvents? { get set }
    
    func fetchPosts()
}
