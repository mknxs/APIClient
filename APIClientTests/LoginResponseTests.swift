//
//  LoginResponseTests.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import XCTest
@testable import APIClient

class LoginResponseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginResponse() {
        let json1 = ["test": "Test"]
        var helper = JsonHelper(json: json1)
        let res = LoginResponse()
        XCTAssertFalse(res.process(responseJson: helper))
        XCTAssertNil(res.token)
        let json2 = ["token": "Token"]
        helper = JsonHelper(json: json2)
        XCTAssertTrue(res.process(responseJson: helper))
        XCTAssertEqual(res.token, "Token")
    }
}
