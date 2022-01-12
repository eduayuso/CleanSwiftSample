//
//  HomeTestCase.swift
//  CleanSwiftSampleUITests
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation
import XCTest

class HomeUITestCase: UITestCase {
    
    func testNavigationBar() {
        
        let feedTitle = "Feed"
        let friendsTitle = "Friends"
        let tagsTitle = "Tags"
        
        // First navigation item
        XCTAssertTrue(app.navigationBars.staticTexts[feedTitle].exists)
        
        app.buttons[friendsTitle].tap()
        XCTAssertTrue(app.navigationBars.staticTexts[friendsTitle].exists)
        
        app.buttons[tagsTitle].tap()
        XCTAssertTrue(app.navigationBars.staticTexts[tagsTitle].exists)
    }
}
