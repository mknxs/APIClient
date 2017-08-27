//
//  LoginResponse.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

class LoginResponse: Response {
    
    var token: String? = nil
    
    func process(responseJson json: JsonHelper) -> Bool {
        let k = KeyPaths.shared
        if let token: String = json.value(for: k.token) {
            self.token = token
            return true
        }
        return false
    }
}
