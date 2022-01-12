//
//  PostsCacheRepository.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

class PostsCacheRepository: CacheRepository {
    
    typealias KeyType = String
    typealias EntityType = PostEntity
    
    private var postList: [PostEntity] = []
    
    func add(items: [PostEntity]) {
    }
    
    func getById(id: String) -> PostEntity? {
        
        return self.postList.first(where: {
            $0.id == id
        })
    }
    
    func getAll() -> [PostEntity] {
        
        return self.postList
    }
}
