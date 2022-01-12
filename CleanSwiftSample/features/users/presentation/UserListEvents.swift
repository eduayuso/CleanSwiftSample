//
//  UserListEvents.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation

protocol UserListEvents: AnyObject {
    
    func onUserListFetched(users: [UserEntity])
    
    func onServerError(message: String)
}
