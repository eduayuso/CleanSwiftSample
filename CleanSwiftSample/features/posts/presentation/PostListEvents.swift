//
//  PostListEvents.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

protocol PostListEvents: AnyObject {
    
    func onPostListFetched(posts: [PostEntity])
    
    func onServerError(message: String)
}
