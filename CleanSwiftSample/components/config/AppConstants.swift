//
//  AppConstants.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import Foundation

struct AppConstants {
    
    /**
     * Dummy API with app id authorization
     */
    static let API_URL = "https://dummyapi.io/data/v1/"
    static let API_APP_ID_KEY = "app-id"
    static let API_APP_ID_VALUE = "6116448b7a91f52f4b01c809" // this should be in an environment var
    
    // API resources
    static let API_USER = "user"
    static let API_POST = "post"
    
    // UI accesibility ids
    static let USERS_TABLE_VIEW_ID = "UserListTableView"
    static let USER_TABLE_VIEW_CELL_ID = "UserTableViewCell"
}
