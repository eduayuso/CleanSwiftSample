//
//  CodableEntity.swift.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

protocol EntityProtocol {}

protocol CodableEntity: Codable, EntityProtocol {
    
    var dataEncoded: Data { get }
}

extension CodableEntity {
    
    var dataEncoded: Data {
        
        let jsonData = try! JSONEncoder().encode(self)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        return jsonString.data(using: String.Encoding.utf8)!
    }
}
