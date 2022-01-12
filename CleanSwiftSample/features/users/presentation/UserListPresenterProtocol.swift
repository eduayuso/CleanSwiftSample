//
//  UserListPresenter.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation

protocol UserListPresenterProtocol {
    
    var listener: UserListEvents? { get set }
    
    func fetchUsers()
}
