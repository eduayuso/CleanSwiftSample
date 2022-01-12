//
//  RemoteTarget.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation
import Moya

enum UsersTarget {
    
    case getList(filter:[String:String])
    case get(id: String)
}

extension UsersTarget: TargetType {
    
    var path: String {
        
        let resourceTag = AppConstants.API_USER
        
        switch self {
            
        case .getList:
            return resourceTag + "/"
        case .get(let id):
            return resourceTag + "/\(id)/"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            
        case .getList, .get(_):
            return .get
        }
    }
    
    var task: Task {
        
        switch self {
            
        case .getList(let filter):
            return .requestParameters(parameters:filter, encoding: URLEncoding.default)
            
        case .get(_):
            return .requestPlain
        }
    }
    
    /**
     * Mock data for testing
     */
    var sampleData: Data {
        
        switch self {
            
        case .getList(let filter):
            
            let usersData = UserListDataEntity(data: [MockData.mockUser1, MockData.mockUser2])
            return usersData.dataEncoded
            
        case .get(_):
            
            return MockData.mockUser1.dataEncoded
        }
    }
}
