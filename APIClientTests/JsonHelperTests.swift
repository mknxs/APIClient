//
//  JsonHelperTests.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import XCTest
@testable import APIClient

class JsonHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    struct Fixture {
        struct Key {
            static let String = "string"
            static let Integer = "integer"
            static let Array = "array"
            static let Object = "object"
            static let Key1 = "key1"
            static let Key2 = "key2"
        }
        
        static let JsonObject = [
            Key.String: "String",
            Key.Integer: 100,
            Key.Array: ["A", "B", "C"],
            Key.Object: [Key.Key1: Key.Key2, "key2": "Key2"]
            ] as [String : Any]
    }
    
    func testAccessor() {
        typealias F = Fixture
        typealias K = F.Key
        let json = F.JsonObject
        let helper = JsonHelper(json: json)
        XCTAssertNotNil(helper.json)
        if let s: String = helper.value(for: K.String) {
            XCTAssertEqual(s, json[K.String] as! String)
        } else {
            XCTFail(K.String)
        }
        if let i: Int = helper.value(for: K.Integer) {
            XCTAssertEqual(i, json[K.Integer] as! Int)
        } else {
            XCTFail(K.Integer)
        }
        if let a: [String] = helper.value(for: K.Array) {
            XCTAssertEqual(a, json[K.Array] as! [String])
        } else {
            XCTFail(K.Array)
        }
        if let o: [String: String] = helper.value(for: K.Object) {
            XCTAssertEqual(o, json[K.Object] as! [String: String])
        }
    }
}
