//
//  APIConstants.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation
import Alamofire

class APIConstants {
 
    static let `default` = APIConstants()

    enum Kind {
        case login
    }
    
    struct Constants {
        static let BaseUrl = "http://localhost:3000/"
    }
    
    func url(for kind: Kind) -> URL? {
        if let base = URL(string: Constants.BaseUrl) {
            return base.appendingPathComponent(self.path(for: kind))
        }
        return nil
    }
    
    func httpMethod(for kind: Kind) -> Alamofire.HTTPMethod {
        switch kind {
        case .login:
            return .get
        }
    }
    
    fileprivate func path(for kind: Kind) -> String {
        switch kind {
        case .login:
            return "login"
        }
    }
}
