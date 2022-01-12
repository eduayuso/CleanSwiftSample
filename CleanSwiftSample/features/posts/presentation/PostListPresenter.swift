//
//  PostListPresenter.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import RxSwift

class PostListPresenter: PostListPresenterProtocol {
    
    var interactor: PostsUseCases
    weak var listener: PostListEvents? // it must be weak (or unowned) to avoid retain cycles

    private let disposeBag = DisposeBag()
    
    init(interactor: PostsUseCases) {
        
        self.interactor = interactor
    }
    
    func fetchPosts() {
        
        self.interactor.fetchLatestPosts()!.subscribe(
            
            onSuccess: { postList in
                self.listener?.onPostListFetched(posts: postList)
               
            },
            onError: { error in
                self.listener?.onServerError(message: error.localizedDescription)
            }
            
        ).disposed(by: disposeBag)
    }
}
