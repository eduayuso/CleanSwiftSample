//
//  PostsRemoteRepository.swift.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import RxSwift
import Moya

class PostsRemoteRepository: RemoteRepository {
    
    typealias KeyType = String
    typealias EntityType = PostEntity
    
    // Network provider
    lazy var network: MoyaProvider<PostsTarget> = {
        // If test is running then the stub for mock data is provided
        if (self.isTestTarget()) {
            return MoyaProvider<PostsTarget>(stubClosure: MoyaProvider.immediatelyStub)
        } else {
            return MoyaProvider<PostsTarget>()
        }
    }()
    
    func fetchById(id: String) -> Single<PostEntity>? {
        
        return nil
    }
    
    func fetchList() -> Single<[PostEntity]> {
        
        let params = ["limit": "10"]
        
        return self.network.rx
            .request(.getList(filter: params))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(PostListDataEntity.self)
            .map { $0.data ?? [] }
    }
    
    func fetchPostsList() -> Single<[PostEntity]> {
        
        let params = ["limit": "10"]
        
        return self.network.rx
            .request(.getList(filter: params))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(PostListDataEntity.self)
            .map { $0.data ?? [] }
    }
}
