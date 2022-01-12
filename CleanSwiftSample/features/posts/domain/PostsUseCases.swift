//
//  PostsUseCases.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import RxSwift

protocol PostsUseCases: UseCasesProtocol {
    
    func fetchLatestPosts() -> Single<[PostEntity]>?
    
    func fetchPosts(from user: Int) -> Single<[PostEntity]>?
}
