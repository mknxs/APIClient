//
//  ResponseBase.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

class ResponseBase: Response {
    
    required init() {
    }

    func process(responseJson json: JsonHelper) -> Bool {
        return false
    }
}
