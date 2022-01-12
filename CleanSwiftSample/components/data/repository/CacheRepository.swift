//
//  CacheRepository.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation

protocol CacheRepository: RepositoryProtocol {

    associatedtype KeyType
    associatedtype EntityType
    
    func add(items: [EntityType])
    func getById(id: KeyType) -> EntityType?
    func getAll() -> [EntityType]
}
