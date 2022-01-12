//
//  UsersRemoteRepository.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation
import RxSwift
import Moya

class UsersRemoteRepository: RemoteRepository {
    
    typealias KeyType = String
    typealias EntityType = UserEntity
    
    // Network provider
    lazy var network: MoyaProvider<UsersTarget> = {
        // If test is running then the stub for mock data is provided
        if (self.isTestTarget()) {
            return MoyaProvider<UsersTarget>(stubClosure: MoyaProvider.immediatelyStub)
        } else {
            return MoyaProvider<UsersTarget>()
        }
    }()
    
    func fetchById(id: String) -> Single<UserEntity>? {
        
        return self.network.rx
            .request(.get(id: id))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(UserEntity.self)
    }
    
    func fetchList() -> Single<[UserEntity]> {
        
        let params = ["limit": "10"]
        
        return self.network.rx
            .request(.getList(filter: params))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(UserListDataEntity.self)
            .map { $0.data ?? [] }
    }
}
