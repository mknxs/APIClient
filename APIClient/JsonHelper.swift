//
//  JsonHelper.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

class JsonHelper {
    
    typealias JsonObject = [String:Any]
    typealias JsonArray = [Any]
    
    let json: JsonObject
    
    required init(json: JsonObject) {
        self.json = json
    }
    
    /**
     * 保持するJsonObjectの指定のキーに対応する値を取得.
     * 値が存在しない場合、型が合わない場合はnil.
     */
    func value<T>(for key: String) -> T? {
        if let value = self.json[key] as? T {
            return value
        }
        return nil
    }
    
    /**
     * 保持するJsonObjectの指定のキーに対応する値を取得.
     * 値が存在しない場合、型が合わない場合は指定したデフォルト値を返却
     */
    func value<T>(for key: String, default: T) -> T {
        if let value: T = self.value(for: key) {
            return value
        }
        return `default`
    }
}
