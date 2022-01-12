//
//  UsersTestCase.swift
//  CleanSwiftSampleUITests
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import XCTest
import CleanSwiftSample

class UsersUITestCase: UITestCase {
    
    func testUsersTableViewController() {
        
        app.buttons["Friends"].tap()
        
        // Check num of cells according to num of mocked user list
        let usersTable = app.tables.matching(identifier: AppConstants.USERS_TABLE_VIEW_ID)
        let numMockedUsers = 2
        XCTAssertEqual(usersTable.cells.count, numMockedUsers)
        
        // Check data of a cell according to mocked data
        let cellId = "\(AppConstants.USER_TABLE_VIEW_CELL_ID)_0"
        let cell = usersTable.cells.element(matching: .cell, identifier: cellId)
        let expectedTest = "\(MockData.mockUser1.firstName ?? "") \(MockData.mockUser1.lastName ?? "")"
        let labelTest = cell.staticTexts[expectedTest]
        XCTAssert(labelTest.exists)
        
    }
    
    // TODO check interaction with cells (cell.tap() ...)
    func testUserTableViewCell() {
        
        sleep(10)
    }
}
