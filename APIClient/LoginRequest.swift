//
//  LoginRequest.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

class LoginRequest: Request {
 
    var loginId: String? = nil
    var password: String? = nil
    
    func validate() -> Bool {
        guard let id = self.loginId, let pass = self.password else {
            return false
        }
        
        return id.characters.count > 0 && pass.characters.count > 0
    }
    
    var parameters: Dictionary<String, Any> {
        guard let id = self.loginId, let pass = self.password else {
            return [:]
        }
        let k = KeyPaths.shared
        return [k.loginId: id, k.password: pass]
    }
    
    var kind: APIConstants.Kind {
        return .login
    }
}
