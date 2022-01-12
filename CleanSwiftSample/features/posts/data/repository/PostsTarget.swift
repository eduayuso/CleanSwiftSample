//
//  PostsTarget.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import Moya

enum PostsTarget {
    
    case getList(filter:[String:String])
}

extension PostsTarget: TargetType {
    
    var path: String {
        
        let resourceTag = AppConstants.API_POST
        
        switch self {
            
        case .getList:
            return resourceTag + "/"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            
        case .getList:
            return .get
        }
    }
    
    var task: Task {
        
        switch self {
            
        case .getList(let filter):
            return .requestParameters(parameters:filter, encoding: URLEncoding.default)
        }
    }
    
    /**
     * Mock data for testing
     */
    var sampleData: Data {
        
        switch self {
            
        case .getList(_):
            
            let usersData = PostListDataEntity(data: [MockData.post1, MockData.post2])
            return usersData.dataEncoded
        }
    }
}
