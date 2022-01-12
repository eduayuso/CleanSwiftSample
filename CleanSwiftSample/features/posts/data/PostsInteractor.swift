//
//  PostsInteractor.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import RxSwift

class PostsInteractor:
                            
    Interactor<PostsCacheRepository, PostsRemoteRepository>,
    PostsUseCases {
    
    override init(data: DataService<PostsCacheRepository, PostsRemoteRepository>) {
        
        super.init(data: data)
    }
    
    func fetchPosts(from user: Int) -> Single<[PostEntity]>? {
        
        //return self.data.remote?.fetchPosts(from: user)
        
        return nil
    }
    
    func fetchLatestPosts() -> Single<[PostEntity]>? {
        
        return self.data.remote?.fetchList()
    }
}
