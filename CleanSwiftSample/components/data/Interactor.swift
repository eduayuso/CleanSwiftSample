//
//  InteractorProtocol.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation

class Interactor<CacheRepoType:  CacheRepository,
                 RemoteRepoType: RemoteRepository> {
    
    var data: DataService<CacheRepoType, RemoteRepoType>
    
    init(data: DataService<CacheRepoType, RemoteRepoType>) {
        
        self.data = data
    }
}
