//
//  UserListPresenter.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation
import RxSwift

class UserListPresenter: UserListPresenterProtocol {
    
    var interactor: UsersUseCases
    weak var listener: UserListEvents? // it must be weak (or unowned) to avoid retain cycles

    private let disposeBag = DisposeBag()
    
    init(interactor: UsersUseCases) {
        
        self.interactor = interactor
    }
    
    func fetchUsers() {
        
        self.interactor.fetchUserList().subscribe(
            
            onSuccess: { userList in
                self.listener?.onUserListFetched(users: userList)
               
            },
            onError: { error in
                self.listener?.onServerError(message: error.localizedDescription)
            }
            
        ).disposed(by: disposeBag)
    }
}
