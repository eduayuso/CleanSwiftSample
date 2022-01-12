//
//  UITestCase.swift
//  CleanSwiftSampleUITests
//
//  Created by Edu Rodriguez on 12/1/22.
//

import XCTest
import UIKit

class UITestCase: XCTestCase {
   
   var app: XCUIApplication!

   override func setUp() {

       // In UI tests it is usually best to stop immediately when a failure occurs.
       continueAfterFailure = false

       // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
       self.app = XCUIApplication()
       self.app.launchArguments.append("--UITests")
       self.app.launch()
       
       // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
   }

   override func tearDown() {
       self.app.terminate()
   }
}
