//
//  LoginRequestTests.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import XCTest
@testable import APIClient

class LoginRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    struct Constants {
        static let LoginID = "loginid"
        static let Password = "password"
    }
    
    func testLoginRequest() {
        let req = LoginRequest()
        XCTAssertFalse(req.validate())
        XCTAssertEqual(req.parameters.count, 0)
        req.loginId = Constants.LoginID
        XCTAssertFalse(req.validate())
        req.password = Constants.Password
        XCTAssertTrue(req.validate())
        XCTAssertEqual(req.parameters.count, 2)
        let p = req.parameters
        let k = KeyPaths.shared
        XCTAssertEqual(p[k.loginId] as? String, Constants.LoginID)
        XCTAssertEqual(p[k.password] as? String, Constants.Password)
    }
}
