//
//  MockData.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

struct MockData {

    static let mockUser1 = UserEntity(
        id: "1",
        title: "Mr",
        firstName: "User1",
        lastName: "Rodriguez",
        picture: "https://randomuser.me/api/portraits/women/58.jpg",
        email: "user1@test.com"
    )

    static let mockUser2 = UserEntity(
        id: "1",
        title: "Mr",
        firstName: "User2",
        lastName: "Pérez",
        picture: "https://randomuser.me/api/portraits/women/89.jpg",
        email: "user2@test.com"
    )
    
    static let post1 = PostEntity(
        id: "1",
        text: "Post 1 Text",
        image: "https://randomuser.me/api/portraits/women/58.jpg",
        owner: MockData.mockUser1
    )
    
    static let post2 = PostEntity(
        id: "2",
        text: "Post 2 Text",
        image: "https://randomuser.me/api/portraits/women/58.jpg",
        owner: MockData.mockUser2
    )
}
