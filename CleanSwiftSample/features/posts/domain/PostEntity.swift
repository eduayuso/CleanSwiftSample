//
//  PostEntity.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

struct PostEntity: CodableEntity {

    var id: String?
    var text: String?
    var image: String?
    var owner: UserEntity?
}

struct PostListDataEntity: CodableEntity {

    var data: [PostEntity]?
    var total: Int?
    var page: Int?
}
