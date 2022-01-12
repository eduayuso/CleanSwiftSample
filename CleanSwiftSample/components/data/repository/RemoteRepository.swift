//
//  RemoteRepository.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation
import RxSwift
import Moya

/**
 * Repository pattern: protocol with most common used functions in repositories
 */
protocol RemoteRepository: RepositoryProtocol {
    
    associatedtype KeyType
    associatedtype EntityType
    
    func fetchById(id: KeyType) -> Single<EntityType>?
    func fetchList() -> Single<[EntityType]>
    // func update(entity: EntityType)
    // func delete(id: KeyType)
}

extension RemoteRepository {
    
    /**
     * Returns flag that indicates we are running test target
     */
    func isTestTarget() -> Bool {
        
        return CommandLine.arguments.contains("--UITests")
    }
}
