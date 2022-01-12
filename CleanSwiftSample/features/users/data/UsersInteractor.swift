//
//  UsersInteractor.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation
import RxSwift

class UsersInteractor:
                            
    Interactor<UsersCacheRepository, UsersRemoteRepository>,
    UsersUseCases {
    
    override init(data: DataService<UsersCacheRepository, UsersRemoteRepository>) {
        
        super.init(data: data)
    }
    
    func fetchUserList() -> Single<[UserEntity]> {
        
        return self.data.remote?.fetchList() ?? Single.just([])
    }
    
    func getUserDetail(id: String) -> UserEntity? {
        
        return nil
    }
}
