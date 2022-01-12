//
//  UsersCacheRepository.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation

class UsersCacheRepository: CacheRepository {
    
    typealias KeyType = String
    typealias EntityType = UserEntity
    
    private var userList: [UserEntity] = []
    
    func getById(id: String) -> UserEntity? {
        
        return self.userList.first(where: {
            $0.id == id
        })
    }
    
    func getAll() -> [UserEntity] {
        
        return self.userList
    }
    
    func add(items: [UserEntity]) {
        
        self.userList.append(contentsOf: items)
    }
}
