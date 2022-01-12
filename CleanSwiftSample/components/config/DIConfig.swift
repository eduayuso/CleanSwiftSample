//
//  DIConfig.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation
import Swinject
import Moya

struct DIConfig {
    
    static var container = Container()
    
    static func register() {
        
        /**
         * Build data services
         */
        
        let postsService = DataService<PostsCacheRepository, PostsRemoteRepository>(
            cache: PostsCacheRepository(),
            remote: PostsRemoteRepository()
        )
        
        let usersService = DataService<UsersCacheRepository, UsersRemoteRepository>(
            cache: UsersCacheRepository(),
            remote: UsersRemoteRepository()
        )
        
        /**
         * Register dependencies of interactors
         */
        
        container.register(PostsUseCases.self) { r in
            
            PostsInteractor(data: postsService)
        }
        
        container.register(UsersUseCases.self) { r in
            
            UsersInteractor(data: usersService)
        }
        
        /**
         * Register dependencies of presenters
         */
        
        container.register(PostListPresenterProtocol.self) { r in
            
            PostListPresenter(
                interactor: r.resolve(PostsUseCases.self)!
            )
        }
        
        container.register(UserListPresenterProtocol.self) { r in
            
            UserListPresenter(
                interactor: r.resolve(UsersUseCases.self)!
            )
        }
    }
}
