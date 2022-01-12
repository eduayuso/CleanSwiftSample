//
//  UsersUseCases.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 10/1/22.
//

import Foundation
import RxSwift

protocol UsersUseCases: UseCasesProtocol {
    
    func fetchUserList() -> Single<[UserEntity]>
    
    func getUserDetail(id: String) -> UserEntity?
}
