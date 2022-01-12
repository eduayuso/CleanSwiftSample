//
//  UserEntity.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation

struct UserEntity: CodableEntity {
    
    var id: String?
    var title: String?
    var firstName: String?
    var lastName: String?
    var picture: String?
    var email: String?
    
    func formatFullName() -> String {
        
        let titleFormatted = (title ?? "").prefix(1).capitalized + (title ?? "").dropFirst()
        return "\(titleFormatted) \(firstName ?? "") \(lastName ?? "")"
    }
}

struct UserListDataEntity: CodableEntity {
    
    var data: [UserEntity]?
}
