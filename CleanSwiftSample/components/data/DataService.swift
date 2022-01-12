//
//  DataService.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation

class DataService<CacheRepoType:  CacheRepository,
                  RemoteRepoType: RemoteRepository> {
    
    var cache: CacheRepoType?
    var remote: RemoteRepoType?
    
    init(cache: CacheRepoType, remote: RemoteRepoType) {
        
        self.cache = cache
        self.remote = remote
    }
}
