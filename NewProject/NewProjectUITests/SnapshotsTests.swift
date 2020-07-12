//
//  SnapshotsTests.swift
//  NewProjectUITests
//
//  Created by Aleksey on 25.06.2020.
//  Copyright © 2020 Aleksey Mikhlev. All rights reserved.
//
//swiftlint:disable all

import XCTest

class SnapshotsTests: XCTestCase {
    override func setUp() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    func testExample() throws {

        let app = XCUIApplication()

        snapshot("Startup")
        app/*@START_MENU_TOKEN@*/.staticTexts["ГОРОД"]/*[[".buttons[\"ГОРОД\"].staticTexts[\"ГОРОД\"]",".staticTexts[\"ГОРОД\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("List")

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
